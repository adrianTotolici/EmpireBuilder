/// @description call interaction script



if (mouse_check_button_pressed(mb_left)){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	scr_move_humans_to_resources(mouse_x,mouse_y);
	scr_ui_control();
}

if (show_debug){
	show_debug_log(true);
}else{
	show_debug_log(false);
}

if (_show_warning && !start_alarm){
	alarm[0]=120;
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