/// @description Insert description here
event_inherited();
if (harvested && ocupied && time_loop){
	global.food_gather = global.food_gather+food_gather;
	time_loop=false;
	alarm[0]=gather_loop;
}



