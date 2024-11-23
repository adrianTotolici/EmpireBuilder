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