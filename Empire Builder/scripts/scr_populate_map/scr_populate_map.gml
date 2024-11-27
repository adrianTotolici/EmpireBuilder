function scr_populate_map(_sprite_size){
	home_base = instance_create_layer(x, y, "Terrain", obj_base_lvl_0);
	home_base.color_building=spr_main_building_lvl0_blue;
	
	nr_of_hostiles_bases=random_range(10,30);
	for (i=1; i<=nr_of_hostiles_bases; i++){
		xpos=random_range(0,room_width);
		ypos=random_range(0,room_height);
		enemy_base = instance_create_layer(xpos,ypos, "Terrain", obj_base_lvl_0);
		enemy_base.color_building=spr_main_building_lvl0_red;
		enemy_base.enemy_building = true;
	}

	
	
	var _berry_bush = 0.01;
	var _fish_pond = 0.005;
	var _herb_bush = 0.001;
	var _hunting_ground = 0.001;
	var _mushroom_patch = 0.002;
	var _clay_mine = 0.003;
	var _flint_quarry = 0.002;
	var _grass_bush = 0.01;
	var _stick_bush = 0.01;
	var _stone_quarry = 0.001;
	var _forest = 0.001;

	for (i=2;i<array_length(global.terrain_resource_matrix)-2;i++){
		for (j=2;j<array_length(global.terrain_resource_matrix[i])-2;j++){
			var _rand = random(1);
			if (_rand < _berry_bush) { 
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_berry_bush);
	            global.terrain_resource_matrix[i][j] = true; 
			}else if (_rand < _berry_bush + _fish_pond) {
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_fish_pond);
	            global.terrain_resource_matrix[i][j] = true; 
			} else if (_rand < _berry_bush + _fish_pond + _herb_bush) { 
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_herb_bush);
	            global.terrain_resource_matrix[i][j] = true; 
			} else if (_rand < _berry_bush + _fish_pond + _herb_bush + _hunting_ground) { 
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_hunting_ground);
	            global.terrain_resource_matrix[i][j] = true; 
			} else if (_rand < _berry_bush + _fish_pond + _herb_bush + _hunting_ground + _mushroom_patch) { 
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_mushrooms_patch);
	            global.terrain_resource_matrix[i][j] = true; 
			} else if (_rand < _berry_bush + _fish_pond + _herb_bush + _hunting_ground + _mushroom_patch + _clay_mine) { 
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_clay_mine);
	            global.terrain_resource_matrix[i][j] = true; 
			} else if (_rand < _berry_bush + _fish_pond + _herb_bush + _hunting_ground + _mushroom_patch + _clay_mine + _flint_quarry) { 
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_flint_quarry);
	            global.terrain_resource_matrix[i][j] = true; 
			} else if (_rand < _berry_bush + _fish_pond + _herb_bush + _hunting_ground + _mushroom_patch + _clay_mine + _flint_quarry + _grass_bush) { 
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_grass_bush);
	            global.terrain_resource_matrix[i][j] = true; 
			} else if (_rand < _berry_bush + _fish_pond + _herb_bush + _hunting_ground + _mushroom_patch + _clay_mine + _flint_quarry + _grass_bush + _stick_bush) { 
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_stick_bush);
	            global.terrain_resource_matrix[i][j] = true; 
			} else if (_rand < _berry_bush + _fish_pond + _herb_bush + _hunting_ground + _mushroom_patch + _clay_mine + _flint_quarry + _grass_bush + _stick_bush + _stone_quarry) { 
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_stone_quarry);
	            global.terrain_resource_matrix[i][j] = true; 
			} else if (_rand < _berry_bush + _fish_pond + _herb_bush + _hunting_ground + _mushroom_patch + _clay_mine + _flint_quarry + _grass_bush + _stick_bush + _stone_quarry + _forest) { 
				instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_forest);
	            global.terrain_resource_matrix[i][j] = true; 
			}
		}
	}
	
	nr_of_hostiles=random_range(20,200);
	for (i=1; i<=nr_of_hostiles; i++){
		xpos=random_range(0,room_width);
		ypos=random_range(0,room_height);
		instance_create_layer(xpos, ypos, "Terrain", obj_tribal_human_hostile);
	}
}