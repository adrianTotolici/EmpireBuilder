var _display_width = 1280;
var _display_height = 720;
global.dev_mode=false;
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
	
	_display_width = window_get_width();
	_display_height= window_get_height();
}


// Resize the application surface
surface_resize(application_surface, _display_width, _display_height);
window_set_size(_display_width, _display_height);
window_center();
view_enabled = true;
view_set_visible(0, true);

// Set port properties
view_set_wport(0, _display_width);
view_set_hport(0, _display_height);