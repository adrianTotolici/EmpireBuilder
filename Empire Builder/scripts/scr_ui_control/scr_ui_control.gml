function scr_ui_control(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	
	//press exit main menu button
	if (mouse_check_button_pressed(mb_left) && _my>=12 && _my<=sprite_size-12 && _mx>=x_size_ui-(sprite_size*ui_button_scale) && _mx<=x_size_ui){
		game_restart();
	}
	
	// show debug
	if (keyboard_check_released(vk_f1)){
		switch (_ui.show_debug){
			case true:
				_ui.show_debug=false;
				break;
			default:
				_ui.show_debug=true;
				break;
		}
	}

}