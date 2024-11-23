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
show_food_invetory=false;
show_material_inventory=false;
show_tools_inventory=false;
show_armors_inventory=false;
_total_food = 0;
_total_resources = 0;
_total_tools = 0;
_total_armors = 0;
_show_tools_menu=false;
_show_armors_menu=false;

display_set_gui_size(x_size_ui,y_size_ui);
_text_to_display = "Empire Building v0.6";
_text_menu_button = "Menu";
_text_warning = "";

ui_gather_selected=false;
ui_build_selected=false;
ui_attack_selected=false;
obj_to_build_sel=false;
build_obj=noone;

//upgrades
_show_building_menu=false;
xpos_building_menu=0;
ypos_building_menu=0;
_selected_building=noone;

button_bg_col = make_color_rgb(76, 76, 76);
