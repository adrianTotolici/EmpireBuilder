function scr_ui_control(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	
	//press exit main menu button
	if ((mouse_check_button_pressed(mb_left) && _my>=12 && _my<=sprite_size-12 && _mx>=x_size_ui-(sprite_size*ui_button_scale) && _mx<=x_size_ui)){
		game_restart();
	}
}