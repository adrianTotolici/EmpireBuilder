/// @description 
var _cam = view_camera[0];
if (point_in_rectangle(x, y, camera_get_view_x(_cam)-64, camera_get_view_y(_cam)-64, camera_get_view_x(_cam)+camera_get_view_width(_cam)+64, camera_get_view_y(_cam)+camera_get_view_height(_cam)+64)) {
    draw_self();
}

if (hp>1 && hp<max_health){
	var _health_percentage = hp / max_health;
	var _bar_width = 25;
	var _bar_height = 5;
	var _bar_x = x - _bar_width / 2;
	var _bar_y = y - 50;

	draw_set_color(c_black);
	draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_width, _bar_y + _bar_height, false);

	draw_set_color(c_red);
	draw_rectangle(_bar_x, _bar_y, _bar_x + (_bar_width * _health_percentage), _bar_y + _bar_height, false);
	
	obj_ui.show_enemy_health=true;
	obj_ui.enemy_health=hp;
	obj_ui.enemy_max_health=max_health;
}