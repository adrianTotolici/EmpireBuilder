/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
storage_space = 10;
fishing = 0.1;
material_need = scr_init_recepies(obj_fishing_hut_lvl_0);
global.bonuses_map[? global.bonus_keys[0]] = ds_map_find_value(global.bonuses_map, global.bonus_keys[0]) + fishing;
global.storage_space += storage_space;
max_health=15;
hp=max_health;
building_stage0=spr_fish_hut_lvl_0;
building_stage1=spr_fish_hut_lvl_1;
building_stage2=spr_fish_hut_lvl_2;