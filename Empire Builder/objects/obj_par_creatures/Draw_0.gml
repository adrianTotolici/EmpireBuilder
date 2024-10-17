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

if (speed == 0){
	sprite_index=spr_stand;	
}