function scr_map_interactions(_mx, _my){
	var _ui=obj_ui;
	var _resources = instance_position(_mx, _my, obj_par_resources);
	var _buildings_base = instance_position(_mx, _my, obj_base_lvl_0);
	var _buildings_tools = instance_position(_mx, _my, obj_tool_maker_lvl_0);
	var _buildings = instance_position(_mx, _my, obj_par_buildings);
	

	if (instance_exists(_resources)){
		var _tools_available = ds_map_find_value(global.resources_gather_map, _resources.tool_to_use);
		if (_resources.tool_to_use == noone || _tools_available>0){
			if (_resources.harvested==false){
				// send humans to colect resources from base to resource location
				if (_ui.ui_gather_selected && global.pop-global.pop_used >0){
					human=instance_create_layer(obj_base_lvl_0.x, obj_base_lvl_0.y, "Terrain", obj_tribal_human);	
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
				//send humans from resource location to base
				if (!_ui.ui_gather_selected && _resources.ocupied){
					human=instance_create_layer(_resources.x, _resources.y, "Terrain", obj_tribal_human);	
					human.target_x=obj_base_lvl_0.x;
					human.target_y=obj_base_lvl_0.y;
					human.human_created=true;
					_resources.harvested=false;
					_resources.ocupied=false;
					if (_tools_available > 0){
						global.resources_gather_map[? _resources.tool_to_use] = ds_map_find_value(global.resources_gather_map, _resources.tool_to_use) + 1;
					}
				}
			}
		}else{
			_ui._show_warning=true;
			_ui._text_warning="You need more "+_resources.tool_to_use+" !";
		}
	}
	
	// select base
	if (_buildings_base>0){
		if (_ui._show_base_menu){
			_ui._show_base_menu=false;
		}else{
			_ui._show_base_menu=true;
			_ui._show_tools_menu=false;
		}
	}	
	
	// select tool maker
	if (_buildings_tools>0){
		if (_ui._show_tools_menu){
			_ui._show_tools_menu=false;
		}else{
			_ui._show_tools_menu=true;
			_ui._show_base_menu=false;
		}
	}
	
	//building options menu
	if (mouse_check_button_pressed(mb_right)){
		if (_ui._show_building_menu){
			_ui._show_building_menu=false;
		}else{
			if (instance_exists(_buildings)){
				_ui._show_building_menu=true;
				_ui.xpos_building_menu=device_mouse_x_to_gui(0);
				_ui.ypos_building_menu=device_mouse_y_to_gui(0);
				_ui._selected_building=_buildings;
			}
		}
	}
}