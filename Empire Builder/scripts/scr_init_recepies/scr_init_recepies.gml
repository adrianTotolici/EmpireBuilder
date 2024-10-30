// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_init_recepies(_object){
	materials = ds_map_create();
	switch(_object){
		case obj_base_lvl_0:
			ds_map_add(materials, global.resources_keys[0], 25);
			ds_map_add(materials, global.resources_keys[1], 10);
			return materials;
		case obj_house_lvl_0:
			ds_map_add(materials, global.resources_keys[0], 5);
			return materials;
		case obj_storage_lvl_0:
			ds_map_add(materials, global.resources_keys[0], 10);
			ds_map_add(materials, global.resources_keys[1], 5);
			return materials;
		case obj_house_lvl_1:
			ds_map_add(materials, global.resources_keys[0], 15);
			ds_map_add(materials, global.resources_keys[1], 25);
			return materials;
		case obj_tool_maker_lvl_0:
			ds_map_add(materials, global.resources_keys[0], 10);
			ds_map_add(materials, global.resources_keys[1], 15);
			return materials;
		case obj_pickaxe_lvl_0:
			ds_map_add(materials, global.resources_keys[2], 5);
			return materials;
		default:
			return materials;
	}
}