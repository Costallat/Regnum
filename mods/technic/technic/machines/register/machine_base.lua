
local S = technic.getter

local tube = {
	insert_object = function(pos, node, stack, direction)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:add_item("src", stack)
	end,
	can_insert = function(pos, node, stack, direction)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:room_for_item("src", stack)
	end,
	connect_sides = {left = 1, right = 1, back = 1, top = 1, bottom = 1},
}

local function round(v)
	return math.floor(v + 0.5)
end

function technic.register_base_machine(data)
	local typename = data.typename
	local input_size = technic.recipes[typename].input_size
	local machine_name = data.machine_name
	local machine_desc = data.machine_desc
	local tier = data.tier
	local ltier = string.lower(tier)

	local groups = {cracky = 2, technic_machine = 1}
	local active_groups = {cracky = 2, technic_machine = 1, not_in_creative_inventory = 1}
	if data.tube then
		groups.tubedevice = 1
		groups.tubedevice_receiver = 1
		active_groups.tubedevice = 1
		active_groups.tubedevice_receiver = 1
	end


	local formspec =
		"invsize[8,9;]"..
		"list[current_name;src;"..(4-input_size)..",1;"..input_size..",1;]"..
		"list[current_name;dst;5,1;2,2;]"..
		"list[current_player;main;0,5;8,4;]"..
		"listring[current_name;dst]"..
		"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"..
		"label[0,0;"..machine_desc:format(tier).."]"
	if data.upgrade then
		formspec = formspec..
			"list[current_name;upgrade1;1,3;1,1;]"..
			"list[current_name;upgrade2;2,3;1,1;]"..
			"label[1,4;"..S("Upgrade Slots").."]"
	end

	local run = function(pos, node)
		local meta     = minetest.get_meta(pos)
		local inv      = meta:get_inventory()
		local eu_input = meta:get_int(tier.."_EU_input")

		local machine_desc_tier = machine_desc:format(tier)
		local machine_node      = "technic:"..ltier.."_"..machine_name
		local machine_demand    = data.demand

		-- Setup meta data if it does not exist.
		if not eu_input then
			meta:set_int(tier.."_EU_demand", machine_demand[1])
			meta:set_int(tier.."_EU_input", 0)
			return
		end

		local EU_upgrade, tube_upgrade = 0, 0
		if data.upgrade then
			EU_upgrade, tube_upgrade = technic.handle_machine_upgrades(meta)
		end
		if data.tube then
			technic.handle_machine_pipeworks(pos, tube_upgrade)
		end

		local powered = eu_input >= machine_demand[EU_upgrade+1]
		if powered then
			meta:set_int("src_time", meta:get_int("src_time") + round(data.speed*10))
		end
		while true do
			local result = technic.get_recipe(typename, inv:get_list("src"))
			if not result then
				technic.swap_node(pos, machine_node)
				meta:set_string("infotext", S("%s Idle"):format(machine_desc_tier))
				meta:set_int(tier.."_EU_demand", 0)
				meta:set_int("src_time", 0)
				return
			end
			meta:set_int(tier.."_EU_demand", machine_demand[EU_upgrade+1])
			technic.swap_node(pos, machine_node.."_active")
			meta:set_string("infotext", S("%s Active"):format(machine_desc_tier))
			if meta:get_int("src_time") < round(result.time*10) then
				if not powered then
					technic.swap_node(pos, machine_node)
					meta:set_string("infotext", S("%s Unpowered"):format(machine_desc_tier))
				end
				return
			end
			local output = result.output
			if type(output) ~= "table" then output = { output } end
			local output_stacks = {}
			for _, o in ipairs(output) do
				table.insert(output_stacks, ItemStack(o))
			end
			local room_for_output = true
			inv:set_size("dst_tmp", inv:get_size("dst"))
			inv:set_list("dst_tmp", inv:get_list("dst"))
			for _, o in ipairs(output_stacks) do
				if not inv:room_for_item("dst_tmp", o) then
					room_for_output = false
					break
				end
				inv:add_item("dst_tmp", o)
			end
			if not room_for_output then
				meta:set_int("src_time", round(result.time*10))
				return
			end
			meta:set_int("src_time", meta:get_int("src_time") - round(result.time*10))
			inv:set_list("src", result.new_input)
			inv:set_list("dst", inv:get_list("dst_tmp"))
		end
	end
	minetest.register_abm({nodenames = {"technic:"..ltier.."_"..machine_name}, interval = 1, chance = 1, 
		action = function(pos, node)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec",formspec)	
		end
	})
	minetest.register_node("technic:"..ltier.."_"..machine_name, {
		description = machine_desc:format(tier),
		tiles = {"technic_"..ltier.."_"..machine_name.."_top.png", 
	                 "technic_"..ltier.."_"..machine_name.."_bottom.png",
		         "technic_"..ltier.."_"..machine_name.."_side.png",
		         "technic_"..ltier.."_"..machine_name.."_side.png",
		         "technic_"..ltier.."_"..machine_name.."_side.png",
		         "technic_"..ltier.."_"..machine_name.."_front.png"},
		paramtype2 = "facedir",
		groups = groups,
		tube = data.tube and tube or nil,
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		on_construct = function(pos)
			local node = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", machine_desc:format(tier))
			meta:set_int("tube_time",  0)
			meta:set_string("formspec", formspec)
			local inv = meta:get_inventory()
			inv:set_size("src", input_size)
			inv:set_size("dst", 4)
			inv:set_size("upgrade1", 1)
			inv:set_size("upgrade2", 1)
		end,
		can_dig = technic.machine_can_dig,
		allow_metadata_inventory_put = technic.machine_inventory_put,
		allow_metadata_inventory_take = technic.machine_inventory_take,
		allow_metadata_inventory_move = technic.machine_inventory_move,
		technic_run = run,
	})

	minetest.register_node("technic:"..ltier.."_"..machine_name.."_active",{
		description = machine_desc:format(tier),
		tiles = {"technic_"..ltier.."_"..machine_name.."_top.png",
		         "technic_"..ltier.."_"..machine_name.."_bottom.png",
		         "technic_"..ltier.."_"..machine_name.."_side.png",
		         "technic_"..ltier.."_"..machine_name.."_side.png",
		         "technic_"..ltier.."_"..machine_name.."_side.png",
		         "technic_"..ltier.."_"..machine_name.."_front_active.png"},
		paramtype2 = "facedir",
		drop = "technic:"..ltier.."_"..machine_name,
		groups = active_groups,
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		tube = data.tube and tube or nil,
		can_dig = technic.machine_can_dig,
		allow_metadata_inventory_put = technic.machine_inventory_put,
		allow_metadata_inventory_take = technic.machine_inventory_take,
		allow_metadata_inventory_move = technic.machine_inventory_move,
		technic_run = run,
		technic_disabled_machine_name = "technic:"..ltier.."_"..machine_name,
	})

	technic.register_machine(tier, "technic:"..ltier.."_"..machine_name,            technic.receiver)
	technic.register_machine(tier, "technic:"..ltier.."_"..machine_name.."_active", technic.receiver)

end -- End registration

