/// @description Insert description here
event_inherited();
if (harvested && ocupied && time_loop){
	global.food_gather = global.food_gather+food_gather;
	global.resources_gather_map[? "berry"] = ds_map_find_value(global.resources_gather_map, "berry") + food_gather;
	time_loop=false;
	alarm[0]=gather_loop;
}



