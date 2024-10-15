function scr_camera_control(){

	var _travel_x=0;
	var _travel_y=0;
	var _view_x=camera_get_view_x(view_camera[0]);
	var _view_y=camera_get_view_y(view_camera[0]);

	// zoom in 
	if (mouse_wheel_down()){
		if (window_size_w<view_get_wport(0)){
			window_size_w+=32;
			window_size_h+=18;
			camera_set_view_size(view_camera[0],window_size_w,window_size_h);
			camera_set_view_border(view_camera[0],window_size_w,window_size_h);
		}
	}
	if (mouse_wheel_up()){
		if (window_size_w>320){
			window_size_w-=32;
			window_size_h-=18;
			camera_set_view_size(view_camera[0],window_size_w,window_size_h);
			camera_set_view_border(view_camera[0],window_size_w,window_size_h);
		}
	}
	
	if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
		_travel_y=-camera_speed;
	}
	if (keyboard_check(ord("S")) || keyboard_check(vk_down)) {
		_travel_y=+camera_speed;
	}
	if (keyboard_check(ord("A")) || keyboard_check(vk_left)) {
		_travel_x=-camera_speed;
	}
	if (keyboard_check(ord("D")) || keyboard_check(vk_right)) {
		_travel_x=+camera_speed;
	}
	
	camera_set_view_pos(view_camera[0], _view_x+_travel_x, _view_y+_travel_y);
}