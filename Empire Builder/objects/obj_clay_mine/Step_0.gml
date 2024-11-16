/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (harvested && ocupied && time_loop){
	var _bonus = ds_map_find_value(global.bonuses_map, global.bonus_keys[2]);
	global.resources_gather_map[? global.resources_keys[1]] = ds_map_find_value(global.resources_gather_map, global.resources_keys[1]) + resources_gather + _bonus;
	time_loop=false;
	alarm[0]=gather_loop;
}
