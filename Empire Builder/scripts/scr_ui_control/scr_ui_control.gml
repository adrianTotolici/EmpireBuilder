function scr_ui_control(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	
	//press exit main menu button
	if (mouse_check_button_pressed(mb_left) && _my>=12 && _my<=_ui.sprite_size-12 && _mx>=_ui.x_size_ui-(_ui.sprite_size*_ui.ui_button_scale) && _mx<=_ui.x_size_ui){
		game_restart();
	}
	
	// gather button pressed
	if( _my<_ui.y_size_ui-12 && _my>_ui.y_size_ui-_ui.sprite_size+12 && _mx>_ui.x_size_ui/2 && _mx<_ui.x_size_ui/2+_ui.sprite_size){
		if (global.pop-global.pop_used >0){
			_ui.ui_gather_selected=true;
		}else{
			_ui._text_warning="No more population"
			_ui._show_warning=true;
			
		}
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