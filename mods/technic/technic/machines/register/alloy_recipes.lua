
local S = technic.getter

technic.register_recipe_type("alloy", {
	description = S("Alloying"),
	input_size = 2,
})

function technic.register_alloy_recipe(data)
	data.time = data.time or 6
	technic.register_recipe("alloy", data)
end

local recipes = {
	{"technic:copper_dust 3",         "technic:tin_dust",           "technic:bronze_dust 4"},
	{"default:copper_ingot 3",        "moreores:tin_ingot",         "default:bronze_ingot 4"},
	{"technic:wrought_iron_dust",     "technic:coal_dust",          "technic:carbon_steel_dust", 3},
	{"technic:wrought_iron_ingot",    "technic:coal_dust",          "technic:carbon_steel_ingot", 3},
	{"technic:carbon_steel_dust",     "technic:coal_dust",          "technic:cast_iron_dust", 3},
	{"technic:carbon_steel_ingot",    "technic:coal_dust",          "technic:cast_iron_ingot", 3},
	{"technic:carbon_steel_dust 3",   "technic:chromium_dust",      "technic:stainless_steel_dust 4"},
	{"technic:carbon_steel_ingot 3",  "technic:chromium_ingot",     "technic:stainless_steel_ingot 4"},
	{"technic:copper_dust 2",         "technic:zinc_dust",          "technic:brass_dust 3"},
	{"default:copper_ingot 2",        "technic:zinc_ingot",         "technic:brass_ingot 3"},
	{"default:sand 2",                "technic:coal_dust 2",        "technic:silicon_wafer"},
	{"technic:silicon_wafer",         "technic:gold_dust",          "technic:doped_silicon_wafer"},
	{"tutorial:uranium1",             "technic:bucket_corium",      "tutorial:plutonium_ingot"},
	{"tutorial:plutonium_ingot",      "technic:bucket_corium",      "tutorial:uranium1"},
	{"tutorial:uranium2",              "technic:bucket_corium",      "tutorial:blei_ingot"},
	{"tutorial:blei_ingot",            "technic:bucket_corium",      "tutorial:uranium2"},
}

for _, data in pairs(recipes) do
	technic.register_alloy_recipe({input = {data[1], data[2]}, output = data[3], time = data[4]})
end
