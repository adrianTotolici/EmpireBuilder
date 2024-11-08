/// @description Insert description here

// Inherit the parent event
event_inherited();
if (harvested && ocupied && time_loop){
	global.resources_gather_map[? global.food_keys[4]] = ds_map_find_value(global.resources_gather_map, global.food_keys[4]) + food_gather;
	global.resources_gather_map[? global.resources_keys[5]] = ds_map_find_value(global.resources_gather_map, global.resources_keys[5]) + bone_gather;
	global.resources_gather_map[? global.resources_keys[6]] = ds_map_find_value(global.resources_gather_map, global.resources_keys[6]) + hide_gather;
	
	time_loop=false;
	alarm[0]=gather_loop;
}
