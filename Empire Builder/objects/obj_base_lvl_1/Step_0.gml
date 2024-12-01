/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (not enemy_building && not init_prop){
	living_space =10;
	storage_space = 15;
	material_need = scr_init_recepies(obj_base_lvl_1);
	global.house +=living_space;
	global.storage_space += storage_space;
	init_prop = true;
}

if (enemy_building && generate_enemy=true){
	alarm[0]=3000;
	generate_enemy=false;
}