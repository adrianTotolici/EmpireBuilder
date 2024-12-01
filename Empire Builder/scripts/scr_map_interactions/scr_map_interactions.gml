function scr_map_interactions(_mx, _my){
	var _ui=obj_ui;
	var _resources = instance_position(_mx, _my, obj_par_resources);
	var _buildings_base0 = instance_position(_mx, _my, obj_base_lvl_0);
	var _buildings_base1 = instance_position(_mx, _my, obj_base_lvl_1);
	var _buildings_tools0 = instance_position(_mx, _my, obj_tool_maker_lvl_0);
	var _buildings_tools1 = instance_position(_mx, _my, obj_tool_maker_lvl_1);
	var _buildings_armor = instance_position(_mx, _my, obj_armor_maker_lvl_0);
	var _buildings = instance_position(_mx, _my, obj_par_buildings);
	var _creature = instance_position(_mx, _my, obj_par_creatures);
	

	if (instance_exists(_resources)){
		var _tools_available = ds_map_find_value(global.resources_gather_map, _resources.tool_to_use);
			if (_resources.harvested==false){
				if (_resources.tool_to_use == noone || _tools_available>0){
					// send humans to colect resources from base to resource location
					if (_ui.ui_gather_selected && global.pop-global.pop_used >0){
						human=instance_create_layer(obj_base_lvl_0.x, obj_base_lvl_0.y, "Terrain", obj_tribal_human);
						human.state_gather= true;
						human.target_x=_resources.x;
						human.target_y=_resources.y;
						human.human_created=true;
						_resources.harvested=true;
						global.pop_used += 1;
						if (_tools_available > 0){
							global.resources_gather_map[? _resources.tool_to_use] = ds_map_find_value(global.resources_gather_map, _resources.tool_to_use) - 1;
						}
					}else{
						_ui.ui_gather_selected=false;
					}
				}else{
					_ui._show_warning=true;
					_ui._text_warning="You need more "+_resources.tool_to_use+" !";
				}
			}else{
				//send humans from resource location to base
				if (!_ui.ui_gather_selected && _resources.ocupied){
					human=instance_create_layer(_resources.x, _resources.y, "Terrain", obj_tribal_human);
					human.state_gather= true;
					human.target_x=obj_base_lvl_0.x;
					human.target_y=obj_base_lvl_0.y;
					human.human_created=true;
					_resources.harvested=false;
					_resources.ocupied=false;
					if (_resources.tool_to_use != noone){
						global.resources_gather_map[? _resources.tool_to_use] = ds_map_find_value(global.resources_gather_map, _resources.tool_to_use) + 1;
					}
				}
			}
		
	}
	
	// select base
	if ((_buildings_base0>0  and not _buildings_base0.enemy_building) || (_buildings_base1>0 &&  not _buildings_base1.enemy_building)){
		if (_ui._show_base_menu){
			_ui._show_base_menu=false;
		}else{
			_ui._show_base_menu=true;
			_ui._show_tools_menu=false;
			_ui._show_armors_menu=false;
		}
	}	
	
	// select tool maker
	if (_buildings_tools0>0 || _buildings_tools1>0){
		if (_ui._show_tools_menu){
			_ui._show_tools_menu=false;
		}else{
			_ui._show_tools_menu=true;
			_ui._show_base_menu=false;
			_ui._show_armors_menu=false;
		}
	}
	
	// select armor maker
	if (_buildings_armor>0){
		if (_ui._show_armors_menu){
			_ui._show_armors_menu=false;
		}else{
			_ui._show_armors_menu=true;
			_ui._show_base_menu=false;
			_ui._show_tools_menu=false;
			
		}
	}
	
	//building options menu
	if (mouse_check_button_pressed(mb_right)){
		if (_ui._show_building_menu){
			_ui._show_building_menu=false;
		}else{
			if (instance_exists(_buildings) and (not _buildings.enemy_building)){
				_ui._show_building_menu=true;
				_ui.xpos_building_menu=device_mouse_x_to_gui(0);
				_ui.ypos_building_menu=device_mouse_y_to_gui(0);
				_ui._selected_building=_buildings;
			}
		}
	}
	
	//attack creature
	if (_ui.ui_attack_selected){
		if (mouse_check_button_pressed(mb_right) and ((instance_exists(_creature)) or ((instance_exists(_buildings) and _buildings.enemy_building)))){
			// send humas to attack
			if (global.soldiers-global.soldiers_used >0 || global.pop-global.pop_used >0){
				if (global.soldiers == global.soldiers_used){
					human=instance_create_layer(obj_base_lvl_0.x, obj_base_lvl_0.y, "Terrain", obj_tribal_human);
				}else{
					human=instance_create_layer(obj_base_lvl_0.x, obj_base_lvl_0.y, "Terrain", obj_tribal_soldier);
				}
				human.state_attack= true;
				if (instance_exists(_creature)){
					human.creature_to_attack=_creature;
				}else if (instance_exists(_buildings)){
					human.creature_to_attack=_buildings;
				}
				human.human_created=true;
				human.base_posx=obj_base_lvl_0.x;
				human.base_posy=obj_base_lvl_0.y;
				if (global.soldiers == global.soldiers_used){
					global.pop_used += 1;
				}else{
					global.soldiers_used += 1;
				}
				
			}
		}
	}
}
