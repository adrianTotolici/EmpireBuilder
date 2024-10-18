/// @description vars
depth =obj_terrain.depth-3;
x_size_ui=window_get_width();
y_size_ui=window_get_height();
ui_button_scale=2;
sprite_size=64;
show_debug=false;
_show_warning = false;
start_alarm=false;
_show_base_menu=false;

display_set_gui_size(x_size_ui,y_size_ui);
_text_to_display = "Empire Building V0.1";
_text_menu_button = "Menu";
_text_warning = "";

ui_gather_selected=false;