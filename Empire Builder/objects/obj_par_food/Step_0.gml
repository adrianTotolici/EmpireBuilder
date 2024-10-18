/// @description Insert description here
if (harvested && ocupied && time_loop){
	sprite_index=spr_ocuppied;
	global.food_gather = global.food_gather+food_gather;
	time_loop=false;
	alarm[0]=gather_loop;
}