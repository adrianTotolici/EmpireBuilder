/// @description draw play gui
draw_set_font(fnt_ui);
draw_set_color(c_black);
draw_text(0, 0,_text_to_display);
draw_text(0, 20, "FPS = " + string(fps));

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

// Draw food info
if (global.food_gather>=1){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui/2,sprite_size/2-10,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_food,0,x_size_ui/2+25,20,0.5,0.5,0,c_white,1);
	draw_text(x_size_ui/2+64,12,string(floor(global.food_gather)));
}

//Draw pop info
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_black_background,0,x_size_ui/2-sprite_size*1.5,sprite_size/2-10,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_population,0,x_size_ui/2-75,20,0.5,0.5,0,c_white,1);
	draw_text(x_size_ui/2-45,12,string(floor(global.pop_used))+"/"+string(floor(global.pop)));
	
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