// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
		//global.food_keys=["berry","fish","herbs","mushrooms","meat"];
		//global.resources_keys=["grass","clay","stone","sticks","flint","bone","hide","wood"];
		//global.tool_keys=["pickaxe","spear","axe"];
function scr_init_recepies(_object){
	materials = ds_map_create();
	switch(_object){
		case obj_base_lvl_0:
			ds_map_add(materials, global.resources_keys[0], 25);
			ds_map_add(materials, global.resources_keys[1], 10);
			ds_map_add(materials, global.resources_keys[2], 5);
			ds_map_add(materials, global.resources_keys[3], 15);
			return materials;
		case obj_house_lvl_0:
			ds_map_add(materials, global.resources_keys[0], 10);
			ds_map_add(materials, global.resources_keys[3], 5);
			return materials;
		case obj_storage_lvl_0:
			ds_map_add(materials, global.resources_keys[3], 20);
			ds_map_add(materials, global.resources_keys[1], 15);
			return materials;
		case obj_house_lvl_1:
			ds_map_add(materials, global.resources_keys[0], 15);
			ds_map_add(materials, global.resources_keys[1], 20);
			ds_map_add(materials, global.resources_keys[2], 5);
			ds_map_add(materials, global.resources_keys[3], 10);
			return materials;
		case obj_tool_maker_lvl_0:
			ds_map_add(materials, global.resources_keys[0], 10);
			ds_map_add(materials, global.resources_keys[3], 20);
			return materials;
		case obj_smoke_house_lvl_0:
			ds_map_add(materials, global.resources_keys[0], 15);
			ds_map_add(materials, global.resources_keys[1], 25);
			ds_map_add(materials, global.resources_keys[2], 5);
			ds_map_add(materials, global.resources_keys[3], 10);
			return materials;
		case obj_fishing_hut_lvl_0:
			ds_map_add(materials, global.resources_keys[0], 15);
			ds_map_add(materials, global.resources_keys[1], 20);
			ds_map_add(materials, global.resources_keys[2], 5);
			ds_map_add(materials, global.resources_keys[3], 5);
			return materials;
		case obj_herbalist_hut_lvl_0:
			ds_map_add(materials, global.resources_keys[0], 10);
			ds_map_add(materials, global.resources_keys[1], 15);
			ds_map_add(materials, global.resources_keys[3], 5);
			return materials;
		case obj_clayworker_hut_lvl0:
			ds_map_add(materials, global.resources_keys[0], 8);
			ds_map_add(materials, global.resources_keys[1], 5);
			ds_map_add(materials, global.resources_keys[3], 5);
			return materials;
		case obj_wonder_lvl0:
			ds_map_add(materials, global.resources_keys[1], 30);
			ds_map_add(materials, global.resources_keys[0], 50);
			ds_map_add(materials, global.resources_keys[3], 30);
			ds_map_add(materials, global.resources_keys[2], 80);
			return materials;
		case obj_pickaxe_lvl_0:
			ds_map_add(materials, global.resources_keys[4], 5);
			ds_map_add(materials, global.resources_keys[3], 2);
			return materials;
		case obj_spear_lvl_0:
			ds_map_add(materials, global.resources_keys[4], 10);
			ds_map_add(materials, global.resources_keys[3], 5);
			return materials;
		case obj_axe_lvl_0:
			ds_map_add(materials, global.resources_keys[4], 5);
			ds_map_add(materials, global.resources_keys[3], 3);
			return materials;
		default:
			return materials;
	}
}