/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
living_space = 1;
storage_space = 5;
material_need = scr_init_recepies(obj_house_lvl_0);
global.house +=living_space;
global.storage_space += storage_space;
max_health=5;
hp=max_health;

building_stage0=spr_house_lvl0_0;
building_stage1=spr_house_lvl0_1;
building_stage2=spr_house_lvl0_2;