global.dev_mode=true;
if (global.dev_mode){
	global.full_screen=false;
}else{
	global.full_screen=true;
}

if (global.full_screen) {
	// Enable borderless fullscreen
	window_enable_borderless_fullscreen(true);

	// Set the window to fullscreen
	window_set_fullscreen(true);
}

// Set the viewport properties
view_xport[0] = 0; // X position of the viewport on the screen
view_yport[0] = 0; // Y position of the viewport on the screen
view_wport[0] = display_get_width(); // Width of the viewport
view_hport[0] = display_get_height(); // Height of the viewport

// Set the view properties
view_xview[0] = 0; // X position of the view in the room
view_yview[0] = 0; // Y position of the view in the room
view_wview[0] = view_wport[0]; // Width of the views
view_hview[0] = view_hport[0]; // Height of the view