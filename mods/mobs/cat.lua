mobs:register_mob("mobs:cat", {
	type = "npc",
	passive = false,
	attack_type = "dogfight",
	damage = 10,
	hp_min = 2000,
	hp_max = 3000,
	armor = 100,
	order = "follow",
	visual_size= {x=1,y=1,z=1},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	visual = "mesh",
	mesh = "mobs_kitten.b3d",
	attacks_monsters = true,
	textures = {
		{"mobs_kitten.png"},
	},
	blood_texture = "default_stone.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	tamed = true,
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fall_damage = 0,
	metadata = 1,
	metadata2 = 1,
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
