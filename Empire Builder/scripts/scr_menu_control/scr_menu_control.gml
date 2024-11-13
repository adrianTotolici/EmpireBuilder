function scr_menu_control(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	
	//press play button
	if ((mouse_check_button_pressed(mb_left) && _my>=y_size_ui/2-72 && _my<=y_size_ui/2+8 && _mx>=x_size_ui/2-(sprite_size*ui_button_scale/2) && _mx<=x_size_ui/2+sprite_size+64)){
		room_goto(rm_play_map);
		init_values();
	}
	
	//press exit button
	if ((mouse_check_button_pressed(mb_left) && _my>=y_size_ui/2+25 && _my<=y_size_ui/2+105 && _mx>=x_size_ui/2-(sprite_size*ui_button_scale/2) && _mx<=x_size_ui/2+sprite_size+64)){
		game_end();
	}
}

function init_values(){
		global.food_keys=["berry","fish","herbs","mushrooms","meat","smoked meat"];
		global.resources_keys=["grass","clay","stone","sticks","flint","bone","hide","wood"];
		global.tool_keys=["pickaxe","spear","axe"];
		global.resources_gather_map =ds_map_create();
		global.game_lost=false;
		global.game_win=false;
		
		if (global.dev_mode){
			//food
			ds_map_add(global.resources_gather_map, global.food_keys[0], 10000);
			ds_map_add(global.resources_gather_map, global.food_keys[1], 0);
			ds_map_add(global.resources_gather_map, global.food_keys[2], 0);
			ds_map_add(global.resources_gather_map, global.food_keys[3], 0);
			ds_map_add(global.resources_gather_map, global.food_keys[4], 10);
			ds_map_add(global.resources_gather_map, global.food_keys[5], 0);
			//materials
			ds_map_add(global.resources_gather_map, global.resources_keys[0], 150);
			ds_map_add(global.resources_gather_map, global.resources_keys[1], 150);
			ds_map_add(global.resources_gather_map, global.resources_keys[2], 150);
			ds_map_add(global.resources_gather_map, global.resources_keys[3], 120);
			ds_map_add(global.resources_gather_map, global.resources_keys[4], 120);
			ds_map_add(global.resources_gather_map, global.resources_keys[5], 120);
			ds_map_add(global.resources_gather_map, global.resources_keys[6], 120);
			ds_map_add(global.resources_gather_map, global.resources_keys[7], 120);
			//tools
			ds_map_add(global.resources_gather_map, global.tool_keys[0], 1);
			ds_map_add(global.resources_gather_map, global.tool_keys[1], 1);
			ds_map_add(global.resources_gather_map, global.tool_keys[2], 1);
		
			global.pop=1;
			global.pop_used=0;
			global.terrain_resource_matrix= [];
			global.house=0;
			global.storage_space=1000;
		}else{
			//food
			ds_map_add(global.resources_gather_map, global.food_keys[0], 10);
			ds_map_add(global.resources_gather_map, global.food_keys[1], 0);
			ds_map_add(global.resources_gather_map, global.food_keys[2], 0);
			ds_map_add(global.resources_gather_map, global.food_keys[3], 0);
			ds_map_add(global.resources_gather_map, global.food_keys[4], 0);
			ds_map_add(global.resources_gather_map, global.food_keys[5], 0);
			//materials
			ds_map_add(global.resources_gather_map, global.resources_keys[0], 0);
			ds_map_add(global.resources_gather_map, global.resources_keys[1], 0);
			ds_map_add(global.resources_gather_map, global.resources_keys[2], 0);
			ds_map_add(global.resources_gather_map, global.resources_keys[3], 0);
			ds_map_add(global.resources_gather_map, global.resources_keys[4], 0);
			ds_map_add(global.resources_gather_map, global.resources_keys[5], 0);
			ds_map_add(global.resources_gather_map, global.resources_keys[6], 0);
			ds_map_add(global.resources_gather_map, global.resources_keys[7], 0);
			//tools
			ds_map_add(global.resources_gather_map, global.tool_keys[0], 0);
			ds_map_add(global.resources_gather_map, global.tool_keys[1], 0);
			ds_map_add(global.resources_gather_map, global.tool_keys[2], 0);
		
			global.pop=4;
			global.pop_used=0;
			global.terrain_resource_matrix= [];
			global.house=0;
			global.storage_space=0;
		}
}