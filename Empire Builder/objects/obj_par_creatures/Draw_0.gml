/// @description Insert description here
draw_self();

if (direction>=0 && direction<45 || direction>=315 && direction <=360){
	image_xscale = -1*xscale;
	image_yscale = 1*yscale;
	sprite_index = spr_side;
}

if (direction>=45 && direction<135){
	image_yscale = 1*yscale;
	image_xscale = 1*xscale;
	sprite_index = spr_up;
}

if (direction>=135 && direction<225){
	image_xscale = 1*xscale;
	image_yscale = 1*yscale;
	sprite_index = spr_side;
}

if (direction>=225 && direction<315){
	image_yscale = 1*yscale;
	image_xscale = 1*xscale;
	sprite_index = spr_down;
}

if (speed == 0 && !state_attack){
	sprite_index=spr_stand;	
}

if (speed==0 && state_attack){
	sprite_index=spr_attack;
}

if (state_defense){
	image_xscale = -1*xscale;
	image_yscale = 1*yscale;
	sprite_index=spr_attack;
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