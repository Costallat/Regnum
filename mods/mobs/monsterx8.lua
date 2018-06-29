mobs:register_mob("mobs:stone_monster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 1,
	hp_min = 4,
	hp_max = 8,
	armor = 100,
	visual_size = {x=3, y=2.6},
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.x",
	textures = {
		{"mobs_stone_monster.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "tutorial:geschenkpapier",
		chance = 1, 
		min = 16, 
		max = 32},
		{name = "tutorial:geschenkpapier_death",
		chance = 2, 
		min = 16, 
		max = 32},
		{name = "tutorial:dna_string",
		chance = 2, 
		min = 1, 
		max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	},
})

mobs:register_mob("mobs:dirt_monster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 1,
	hp_min = 4,
	hp_max = 8,
	armor = 100,
	visual_size = {x=3, y=2.6},
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.x",
	textures = {
		{"mobs_dirt_monster.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "tutorial:geschenkpapier",
		chance = 1, 
		min = 16, 
		max = 32},
		{name = "tutorial:geschenkpapier_death",
		chance = 2, 
		min = 16, 
		max = 32},
		{name = "tutorial:dna_string",
		chance = 2, 
		min = 1, 
		max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	},
})

mobs:register_mob("mobs:sand_monster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 1,
	hp_min = 4,
	hp_max = 8,
	armor = 100,
	visual_size = {x=3, y=2.6},
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.x",
	textures = {
		{"mobs_sand_monster.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "tutorial:geschenkpapier",
		chance = 1, 
		min = 16, 
		max = 32},
		{name = "tutorial:geschenkpapier_death",
		chance = 2, 
		min = 16, 
		max = 32},
		{name = "tutorial:dna_string",
		chance = 2, 
		min = 1, 
		max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	},
})

mobs:register_mob("mobs:desert_sand_monster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 1,
	hp_min = 4,
	hp_max = 8,
	armor = 100,
	visual_size = {x=3, y=2.6},
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.x",
	textures = {
		{"mobs_desert_sand_monster.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "tutorial:geschenkpapier",
		chance = 1, 
		min = 16, 
		max = 32},
		{name = "tutorial:geschenkpapier_death",
		chance = 2, 
		min = 16, 
		max = 32},
		{name = "tutorial:dna_string",
		chance = 2, 
		min = 1, 
		max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	},
})

mobs:register_mob("mobs:desert_stone_monster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 1,
	hp_min = 4,
	hp_max = 8,
	armor = 100,
	visual_size = {x=3, y=2.6},
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.x",
	textures = {
		{"mobs_desert_stone_monster.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "tutorial:geschenkpapier",
		chance = 1, 
		min = 16, 
		max = 32},
		{name = "tutorial:geschenkpapier_death",
		chance = 2, 
		min = 16, 
		max = 32},
		{name = "tutorial:dna_string",
		chance = 2, 
		min = 1, 
		max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	},
})

mobs:register_mob("mobs:snow_monster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 1,
	hp_min = 4,
	hp_max = 8,
	armor = 100,
	visual_size = {x=3, y=2.6},
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.x",
	textures = {
		{"mobs_snow_monster.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "tutorial:geschenkpapier",
		chance = 1, 
		min = 16, 
		max = 32},
		{name = "tutorial:geschenkpapier_death",
		chance = 2, 
		min = 16, 
		max = 32},
		{name = "tutorial:dna_string",
		chance = 2, 
		min = 1, 
		max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	},
})
mobs:register_spawn("mobs:dirt_monster", {"default:dirt_with_grass", "default:dirt", "default:dirt_with_dry_grass"}, 20, -1, 1, 3, 31000)
mobs:register_spawn("mobs:sand_monster", {"default:sand", "default:silver_sand"}, 20, -1, 1, 3, 31000)
mobs:register_spawn("mobs:stone_monster", {"default:stone", "default:cobble", "default:mossycobble"}, 20, -1, 1, 3, 31000)
mobs:register_spawn("mobs:desert_stone_monster", {"default:desert_stone", "default:desert_cobble"}, 20, -1, 1, 3, 31000)
mobs:register_spawn("mobs:desert_sand_monster", {"default:desert_sand"}, 20, -1, 1, 3, 31000)
mobs:register_spawn("mobs:snow_monster", {"default:snowblock", "default:ice", "default:dirt_with_snow"}, 20, -1, 1, 3, 31000)