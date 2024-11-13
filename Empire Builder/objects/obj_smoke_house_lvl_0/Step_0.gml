/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (smoking_meat){
	if (ds_map_find_value(global.resources_gather_map, global.food_keys[4]) > 0 ){
		global.resources_gather_map[? global.food_keys[4]] = ds_map_find_value(global.resources_gather_map, global.food_keys[4]) - 1;
		global.resources_gather_map[? global.food_keys[5]] = ds_map_find_value(global.resources_gather_map, global.food_keys[5]) + 1.2;
	}
	smoking_meat = false
	alarm[0]=200;
}