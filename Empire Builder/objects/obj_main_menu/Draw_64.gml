/// @description draw buttons
draw_set_font(fnt_ui);
draw_set_color(c_black);

draw_sprite_ext(spr_ui_button_white_background,0,x_size_ui/2-(sprite_size*ui_button_scale/2),y_size_ui/2-32,ui_button_scale,2,0,c_white,1);
draw_text(x_size_ui/2-(sprite_size*ui_button_scale/2)+80,y_size_ui/2-32-8,_start_game);

draw_sprite_ext(spr_ui_button_white_background,0,x_size_ui/2-(sprite_size*ui_button_scale/2),(y_size_ui/2)+sprite_size,ui_button_scale,2,0,c_white,1);
draw_text(x_size_ui/2-(sprite_size*ui_button_scale/2)+80,(y_size_ui/2-8)+sprite_size,_exit_game);

draw_sprite_ext(spr_ui_game_titile,0,x_size_ui/2,128,1,1,0,c_white,1);

draw_set_color(c_white);
draw_set_font(fnt_ui_1);
draw_text(x_size_ui-100,y_size_ui-50,_game_version);
