/// @description draw play gui
draw_set_font(fnt_ui);
draw_set_color(c_black);
draw_text(0, 0,_text_to_display);
if (show_debug){
	draw_text(0, 20, "FPS = " + string(fps));
}
// Draw ui buttons
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui-(sprite_size*ui_button_scale),(sprite_size/2),ui_button_scale,1,0,c_white,1);
draw_text(x_size_ui-(sprite_size*ui_button_scale)/2-25,(sprite_size/2)-8,_text_menu_button);

// Draw ui interact buttons
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui/2,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
draw_sprite_ext(spr_ui_gather,0,x_size_ui/2,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
if (ui_gather_selected){
	draw_sprite_ext(spr_ui_select,0,x_size_ui/2,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
}

//Draw ui interact buttons
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui/2+sprite_size,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
draw_sprite_ext(spr_ui_build,0,x_size_ui/2+sprite_size+5,y_size_ui-(sprite_size/2),0.8,0.8,0,c_white,1);
if (ui_build_selected){
	draw_sprite_ext(spr_ui_select,0,x_size_ui/2+sprite_size,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
}

var _x_pos_start=x_size_ui/2-196;

//Draw pop info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start-sprite_size*1.5,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_population,0,_x_pos_start-75,20,0.5,0.5,0,c_white,1);
draw_text(_x_pos_start-45,12,string(floor(global.pop_used))+"/"+string(floor(global.pop)));

// Draw building info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_house,0,_x_pos_start+25,20,0.5,0.5,0,c_white,1);
draw_text(_x_pos_start+64,12,string(floor(global.house)));

// Draw food info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start+100,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_food,0,_x_pos_start+130,20,0.5,0.5,0,c_white,1);
draw_text(_x_pos_start+164,12,string(floor(_total_food)));

// Draw resources info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start+200,sprite_size/2-10,2,1,0,c_white,1);
draw_sprite_ext(spr_ui_materials,0,_x_pos_start+230,5,0.8,0.8,0,c_white,1);
draw_text(_x_pos_start+264,12,string(floor(_total_resources))+"/"+string(floor(global.storage_space)));

// Draw tools info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start+332,sprite_size/2-10,2,1,0,c_white,1);
draw_sprite_ext(spr_ui_tools,0,_x_pos_start+360,14,0.8,0.8,0,c_white,1);
draw_text(_x_pos_start+385,12,string(floor(_total_tools)));
	
//Show warning
	if (_show_warning) {
		draw_set_color(c_white);
		draw_text_ext_transformed(x_size_ui/2-100,100,_text_warning,10,300,2,2,0);
	}
	
//show base menu
if (_show_base_menu){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_black_background,0,0,y_size_ui/2,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_population,0,sprite_size/2,y_size_ui/2,0.5,0.5,0,c_white,1);
	draw_text(55,y_size_ui/2-7,"+ 1")
}

//show base menu
if (_show_tools_menu){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_black_background,0,0,y_size_ui/2,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_pickaxe_0,0,sprite_size/2,y_size_ui/2+13,0.8,0.8,0,c_white,1);
	draw_text(55,y_size_ui/2-7,"+ 1")
}

//show build menu
if (ui_build_selected){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui-(sprite_size*2)-40,200,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_house_lvl0,0,x_size_ui-(sprite_size*2),200,0.5,0.5,0,c_white,1);
	draw_text(x_size_ui-sprite_size-35,200-7,"straw house")
	
	draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui-(sprite_size*2)-40,240,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_storage_lvl0,0,x_size_ui-(sprite_size*2),232,0.5,0.5,0,c_white,1);
	draw_text(x_size_ui-sprite_size-35,240-7,"storage")
	
	draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui-(sprite_size*2)-40,280,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_house_lvl1,0,x_size_ui-(sprite_size*2),278,0.5,0.5,0,c_white,1);
	draw_text(x_size_ui-sprite_size-35,280-7,"mud house")
	
	draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui-(sprite_size*2)-40,320,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_tool_make_lvl0,0,x_size_ui-(sprite_size*2),315,0.5,0.5,0,c_white,1);
	draw_text(x_size_ui-sprite_size-35,320-7,"tool maker")
}

if (obj_to_build_sel){
	draw_sprite_ext(object_get_sprite(build_obj),0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),1,1,0,c_white,0.5);
}

if (show_food_invetory){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start+100,sprite_size/2+32,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_berry,0,_x_pos_start+120,sprite_size/2+45,0.8,0.8,0,c_white,1);
	draw_text(_x_pos_start+150,sprite_size/2+20,string(floor(ds_map_find_value(global.resources_gather_map, global.food_keys[0]))));
	
	draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start+100,sprite_size+45,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_fish,0,_x_pos_start+120,sprite_size+55,0.8,0.8,0,c_white,1);
	draw_text(_x_pos_start+150,sprite_size+35,string(floor(ds_map_find_value(global.resources_gather_map, global.food_keys[1]))));
}

if (show_material_inventory){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start+200,sprite_size/2+32,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_grass,0,_x_pos_start+230,sprite_size/2+45,0.8,0.8,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size/2+20,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[0]))));
	
	draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start+200,sprite_size+45,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_clay,0,_x_pos_start+230,sprite_size+55,0.8,0.8,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size+35,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[1]))));
	
	draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start+200,sprite_size+90,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_stone,0,_x_pos_start+230,sprite_size+97,0.8,0.8,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size+82,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[2]))));
}

if (show_tools_inventory){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_black_background,0,_x_pos_start+332,sprite_size/2+32,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_pickaxe_0,0,_x_pos_start+360,sprite_size/2+45,0.8,0.8,0,c_white,1);
	draw_text(_x_pos_start+385,sprite_size/2+20,string(floor(ds_map_find_value(global.resources_gather_map, global.tool_keys[0]))));
}