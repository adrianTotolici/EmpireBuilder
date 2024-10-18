/// @description Insert description here
if (harvested && ocupied && time_loop){
	sprite_index=spr_ocuppied;
	global.resources_gather = global.resources_gather+resources_gather;
	time_loop=false;
	alarm[0]=gather_loop;
}