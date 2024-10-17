/// @description call interaction script
scr_ui_control();



if (mouse_check_button_pressed(mb_left)){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	show_debug_message("mouse click my="+string(_my));
	show_debug_message("mouse click mx="+string(_mx));
	if( _my<y_size_ui-12 && _my>y_size_ui-sprite_size+12 && _mx>x_size_ui/2 && _mx<x_size_ui/2+sprite_size){
		ui_gather_selected=true;
	}else{
		scr_move_humans_to_resources(mouse_x,mouse_y);
		ui_gather_selected=false;
	}
}

if (show_debug){
	show_debug_log(true);
}else{
	show_debug_log(false);
}