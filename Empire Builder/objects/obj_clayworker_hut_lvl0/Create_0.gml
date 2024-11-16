/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
storage_space = 5;
clayworker = 0.05;
material_need = scr_init_recepies(obj_clayworker_hut_lvl0);
global.bonuses_map[? global.bonus_keys[2]] = ds_map_find_value(global.bonuses_map, global.bonus_keys[0]) + clayworker;
global.storage_space += storage_space;
max_health=10;
hp=max_health;