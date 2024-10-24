/// @description Insert description here
var _cam = view_camera[0];
if (point_in_rectangle(x, y, camera_get_view_x(_cam)-64, camera_get_view_y(_cam)-64, camera_get_view_x(_cam)+camera_get_view_width(_cam)+64, camera_get_view_y(_cam)+camera_get_view_height(_cam)+64)) {
    draw_self();
}