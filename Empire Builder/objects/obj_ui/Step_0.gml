/// @description call interaction script
if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	scr_map_interactions(mouse_x,mouse_y);
	scr_ui_control();
}

if (show_debug){
	show_debug_log(true);
}else{
	show_debug_log(false);
}

if (_show_warning && !start_alarm){
	alarm[0]=200;
	start_alarm=true
}

// show debug
if (keyboard_check_released(vk_f1)){
	switch (show_debug){
		case true:
			show_debug=false;
			break;
		default:
			show_debug=true;
			break;
	}
}

if (keyboard_check_released(vk_f12)){
	global.resources_gather_map =ds_map_create();
	//food
	ds_map_add(global.resources_gather_map, global.food_keys[0], 5000);
	ds_map_add(global.resources_gather_map, global.food_keys[1], 0);
	ds_map_add(global.resources_gather_map, global.food_keys[2], 0);
	ds_map_add(global.resources_gather_map, global.food_keys[3], 0);
	ds_map_add(global.resources_gather_map, global.food_keys[4], 10);
	ds_map_add(global.resources_gather_map, global.food_keys[5], 0);
	//materials
	ds_map_add(global.resources_gather_map, global.resources_keys[0], 150);
	ds_map_add(global.resources_gather_map, global.resources_keys[1], 150);
	ds_map_add(global.resources_gather_map, global.resources_keys[2], 500);
	ds_map_add(global.resources_gather_map, global.resources_keys[3], 200);
	ds_map_add(global.resources_gather_map, global.resources_keys[4], 120);
	ds_map_add(global.resources_gather_map, global.resources_keys[5], 120);
	ds_map_add(global.resources_gather_map, global.resources_keys[6], 120);
	ds_map_add(global.resources_gather_map, global.resources_keys[7], 120);
	//tools
	ds_map_add(global.resources_gather_map, global.tool_keys[0], 1);
	ds_map_add(global.resources_gather_map, global.tool_keys[1], 1);
	ds_map_add(global.resources_gather_map, global.tool_keys[2], 1);
	//armors
	ds_map_add(global.resources_gather_map, global.armor_keys[0], 0);
		
	global.pop=20;
	global.pop_used=0;
	global.terrain_resource_matrix= [];
	global.house=20;
	global.storage_space=10000;
}

if (mouse_check_button_pressed(mb_right)){
	if (ui_gather_selected){
		ui_gather_selected=false;
	}
}
_total_food = 0
for (var _i=0; _i<array_length(global.food_keys); _i++){
	_total_food += ds_map_find_value(global.resources_gather_map, global.food_keys[_i]);
}

_total_resources=0;
for (var _i=0; _i<array_length(global.resources_keys); _i++){
	_total_resources += ds_map_find_value(global.resources_gather_map, global.resources_keys[_i]);
}

_total_tools=0;
for (var _i=0; _i<array_length(global.tool_keys); _i++){
	_total_tools += ds_map_find_value(global.resources_gather_map, global.tool_keys[_i]);
}

_total_armors=0;
for (var _i=0; _i<array_length(global.armor_keys); _i++){
	_total_armors += ds_map_find_value(global.resources_gather_map, global.armor_keys[_i]);
}