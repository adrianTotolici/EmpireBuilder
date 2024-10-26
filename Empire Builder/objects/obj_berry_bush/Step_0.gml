/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (harvested && ocupied && time_loop){
	global.resources_gather_map[? global.food_keys[0]] = ds_map_find_value(global.resources_gather_map, global.food_keys[0]) + food_gather;
	time_loop=false;
	alarm[0]=gather_loop;
}
