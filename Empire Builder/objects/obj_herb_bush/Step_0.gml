/// @description Insert description here

// Inherit the parent event
event_inherited();
if (harvested && ocupied && time_loop){
	var _bonus = ds_map_find_value(global.bonuses_map, global.bonus_keys[1]);
	global.resources_gather_map[? global.food_keys[2]] = ds_map_find_value(global.resources_gather_map, global.food_keys[2]) + food_gather + _bonus;
	time_loop=false;
	alarm[0]=gather_loop;
}
