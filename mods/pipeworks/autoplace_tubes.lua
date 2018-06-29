-- autorouting for pneumatic tubes

local function is_tube(nodename)
	return table.contains(pipeworks.tubenodes, nodename)
end

--a function for determining which side of the node we are on
local function nodeside(node, tubedir)
	if node.param2 < 0 or node.param2 > 23 then
		node.param2 = 0
	end

	local backdir = minetest.facedir_to_dir(node.param2)
	local back = vector.dot(backdir, tubedir)
	if back == 1 then
		return "back"
	elseif back == -1 then
		return "front"
	end

	local topdir = minetest.facedir_to_top_dir(node.param2)
	local top = vector.dot(topdir, tubedir)
	if top == 1 then
		return "top"
	elseif top == -1 then
		return "bottom"
	end

	local rightdir = minetest.facedir_to_right_dir(node.param2)
	local right = vector.dot(rightdir, tubedir)
	if right == 1 then
		return "right"
	else
		return "left"
	end
end

local vts = {0, 3, 1, 4, 2, 5}
local tube_table = {[0] = 1, 2, 2, 4, 2, 4, 4, 5, 2, 3, 4, 6, 4, 6, 5, 7, 2, 4, 3, 6, 4, 5, 6, 7, 4, 6, 6, 8, 5, 7, 7, 9, 2, 4, 4, 5, 3, 6, 6, 7, 4, 6, 5, 7, 6, 8, 7, 9, 4, 5, 6, 7, 6, 7, 8, 9, 5, 7, 7, 9, 7, 9, 9, 10}
local tube_table_facedirs = {[0] = 0, 0, 5, 0, 3, 4, 3, 0, 2, 0, 2, 0, 6, 4, 3, 0, 7, 12, 5, 12, 7, 4, 5, 5, 18, 20, 16, 0, 7, 4, 7, 0, 1, 8, 1, 1, 1, 13, 1, 1, 10, 8, 2, 2, 17, 4, 3, 6, 9, 9, 9, 9, 21, 13, 1, 1, 10, 10, 11, 2, 19, 4, 3, 0}
local function tube_autoroute(pos)
	local active = {0, 0, 0, 0, 0, 0}
	local nctr = minetest.get_node(pos)
	if not is_tube(nctr.name) then return end

	local adjustments = {
		{x = -1, y =  0, z =  0},
		{x =  1, y =  0, z =  0},
		{x =  0, y = -1, z =  0},
		{x =  0, y =  1, z =  0},
		{x =  0, y =  0, z = -1},
		{x =  0, y =  0, z =  1}
	}
	-- xm = 1, xp = 2, ym = 3, yp = 4, zm = 5, zp = 6

	local positions = {}
	local nodes = {}
	for i, adj in ipairs(adjustments) do
		positions[i] = vector.add(pos, adj)
		nodes[i] = minetest.get_node(positions[i])
	end

	for i, node in ipairs(nodes) do
		local idef = minetest.registered_nodes[node.name]
		-- handle the tubes themselves
		if is_tube(node.name) then
			active[i] = 1
		-- handle new style connectors
		elseif idef and idef.tube and idef.tube.connect_sides then
			local dir = adjustments[i]
			if idef.tube.connect_sides[nodeside(node, vector.multiply(dir, -1))] then
				active[i] = 1
			end
		end
	end

	-- all sides checked, now figure which tube to use.

	local nodedef = minetest.registered_nodes[nctr.name]
	local basename = nodedef.basename
	if nodedef.style == "old" then
		local nsurround = ""
		for i, n in ipairs(active) do
			nsurround = nsurround..n
		end
		nctr.name = basename.."_"..nsurround
	elseif nodedef.style == "6d" then
		local s = 0
		for i, n in ipairs(active) do
			if n == 1 then
				s = s + 2^vts[i]
			end
		end
		nctr.name = basename.."_"..tube_table[s]
		nctr.param2 = tube_table_facedirs[s]
	end
	minetest.swap_node(pos, nctr)
end

function pipeworks.scan_for_tube_objects(pos)
	for side = 0, 6 do
		tube_autoroute(vector.add(pos, directions.side_to_dir(side)))
	end
end

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
	if minetest.registered_items[newnode.name]
	  and minetest.registered_items[newnode.name].tube
	  and minetest.registered_items[newnode.name].tube.connect_sides then
		pipeworks.scan_for_tube_objects(pos)
	end
end)

minetest.register_on_dignode(function(pos, oldnode, digger)
	if minetest.registered_items[oldnode.name]
	  and minetest.registered_items[oldnode.name].tube
	  and minetest.registered_items[oldnode.name].tube.connect_sides then
		pipeworks.scan_for_tube_objects(pos)
	end
end)

if minetest.get_modpath("mesecons_mvps") then
	mesecon.register_on_mvps_move(function(moved_nodes)
		for _, n in ipairs(moved_nodes) do
			pipeworks.scan_for_tube_objects(n.pos)
			pipeworks.scan_for_tube_objects(n.oldpos)
		end
	end)
end

