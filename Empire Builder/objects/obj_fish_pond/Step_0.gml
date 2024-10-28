/// @description Insert description here

// Inherit the parent event
event_inherited();
if (harvested && ocupied && time_loop){
	global.resources_gather_map[? global.food_keys[1]] = ds_map_find_value(global.resources_gather_map, global.food_keys[1]) + food_gather;
	time_loop=false;
	alarm[0]=gather_loop;
}
