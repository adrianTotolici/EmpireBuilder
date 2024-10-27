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
		global.food_keys=["berry"];
		global.resources_keys=["grass","clay"];
		global.resources_gather_map =ds_map_create();
		ds_map_add(global.resources_gather_map, global.food_keys[0], 1);
		ds_map_add(global.resources_gather_map, global.resources_keys[0], 30);
		ds_map_add(global.resources_gather_map, global.resources_keys[1], 2);
		
		global.pop=1;
		global.pop_used=0;
		global.terrain_resource_matrix= [];
		global.house=0;
		global.storage_space=0;
}