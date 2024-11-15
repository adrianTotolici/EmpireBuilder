/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
storage_space = 8;
herbalist = 0.01;
material_need = scr_init_recepies(obj_herbalist_hut_lvl_0);
global.bonuses_map[? global.bonus_keys[1]] = ds_map_find_value(global.bonuses_map, global.bonus_keys[1]) + herbalist;
global.storage_space += storage_space;
max_health=10;
hp=max_health;