/// @description vars
randomize();
gpu_set_tex_filter(false);
game_set_speed(120, gamespeed_fps);


window_size_w=window_get_width();
window_size_h=window_get_height();

width_step=128;
height_step=72;

camera_speed=2;

_monitor_size_w=display_get_width();
_monitor_size_h=display_get_height();

window_set_position(_monitor_size_w/2-window_size_w/2,_monitor_size_h/2-window_size_h/2);
