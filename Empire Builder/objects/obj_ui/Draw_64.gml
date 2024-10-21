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

//Draw pop info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui/2-sprite_size*1.5,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_population,0,x_size_ui/2-75,20,0.5,0.5,0,c_white,1);
draw_text(x_size_ui/2-45,12,string(floor(global.pop_used))+"/"+string(floor(global.pop)));

// Draw food info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui/2,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_house,0,x_size_ui/2+25,20,0.5,0.5,0,c_white,1);
draw_text(x_size_ui/2+64,12,string(floor(global.house)));


// Draw resources info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui/2+100,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_food,0,x_size_ui/2+130,20,0.5,0.5,0,c_white,1);
draw_text(x_size_ui/2+164,12,string(floor(global.food_gather)));

// Draw resources info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui/2+200,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_materials,0,x_size_ui/2+230,5,0.8,0.8,0,c_white,1);
draw_text(x_size_ui/2+264,12,string(floor(global.resources_gather)));
	
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

//show build menu
if (ui_build_selected){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui-(sprite_size*2)-40,200,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_house_lvl0,0,x_size_ui-(sprite_size*2),200,0.5,0.5,0,c_white,1);
	draw_text(x_size_ui-sprite_size-35,200-7,"house lvl 0")
}

if (obj_to_build_sel){
	draw_sprite_ext(build_obj,0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),1,1,0,c_white,0.5);
}