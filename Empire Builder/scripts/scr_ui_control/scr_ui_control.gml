function scr_ui_control(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	var _x_start_pos=x_size_ui/2-196;
		
	var _human_price=10;
	var _soldier_price=10;

	//press exit main menu button
	if (mouse_check_button_pressed(mb_left) && _my>=12 && _my<=_ui.sprite_size-12 && _mx>=_ui.x_size_ui-(_ui.sprite_size*_ui.ui_button_scale) && _mx<=_ui.x_size_ui){
		game_restart();
	}
	
	// gather button pressed
	if( _my<_ui.y_size_ui-12 && _my>_ui.y_size_ui-_ui.sprite_size+12 && _mx>_ui.x_size_ui/2 && _mx<_ui.x_size_ui/2+_ui.sprite_size){
		if (_ui.ui_gather_selected){
			_ui.ui_gather_selected=false;
		}else{	
			if (global.pop-global.pop_used >0){
				_ui.ui_gather_selected=true;
			}else{
				_ui._text_warning="No more available population"
				_ui._show_warning=true;	
			}
		}
	}
	
	//build button pressed
	if( _my<_ui.y_size_ui-12 && _my>_ui.y_size_ui-_ui.sprite_size+12 && _mx>_ui.x_size_ui/2+_ui.sprite_size && _mx<_ui.x_size_ui/2+(_ui.sprite_size*2)){
		if (_ui.ui_build_selected){
			_ui.ui_build_selected=false;
		}else{
			_ui.ui_build_selected=true;
		}
	}
	
	//attack button pressed
	if ( _my<_ui.y_size_ui-12 && _my>_ui.y_size_ui-_ui.sprite_size+12 && _mx>_ui.x_size_ui/2+_ui.sprite_size*2 && _mx<_ui.x_size_ui/2+(_ui.sprite_size*3)){
		if (_ui.ui_attack_selected){
			_ui.ui_attack_selected=false;
		}else{
			_ui.ui_attack_selected=true;
		}
	}
	
	if (mouse_check_button_pressed(mb_right)){
		_ui.ui_gather_selected=false;
		_ui.ui_build_selected = false;
		_ui.obj_to_build_sel=false;
		_ui.build_obj=noone;
		
	}

	// build human menu button
	if (mouse_check_button_pressed(mb_left) &&  _ui._show_base_menu){
		if (_my>y_size_ui/2-15 && _my<y_size_ui/2+20 && _mx>0 && _mx<sprite_size*1.5-10){
			if (global.house >= global.pop+1){
				var _total_food = 0;
				for (var _i=0; _i<array_length(global.food_keys); _i++){
					_total_food += ds_map_find_value(global.resources_gather_map, global.food_keys[_i]);
				}
				if (_total_food>=_human_price){
					_food_to_pay=_human_price;
					for (var _i=0; _i<array_length(global.food_keys); _i++){
						if (_food_to_pay <= ds_map_find_value(global.resources_gather_map, global.food_keys[_i])){
							global.resources_gather_map[? global.food_keys[_i]] = ds_map_find_value(global.resources_gather_map, global.food_keys[_i]) - _food_to_pay;
							break;
						}else{		
							_food_to_pay -= ds_map_find_value(global.resources_gather_map, global.food_keys[_i]);
							global.resources_gather_map[? global.food_keys[_i]] = 0;
						}
					}
					global.pop += 1;
				}else{
					_ui._text_warning="Need "+string(_human_price)+" more food";
					_ui._show_warning=true;
				}
			}else{
				_ui._text_warning="Need more houses";
				_ui._show_warning=true;
			}
		}
		
		if (_my>y_size_ui/2-65 && _my<y_size_ui/2+30 && _mx>0 && _mx<sprite_size*1.5-10){
			if (global.pop_used < global.pop){
				var _total_food = 0;
				for (var _i=0; _i<array_length(global.food_keys); _i++){
					_total_food += ds_map_find_value(global.resources_gather_map, global.food_keys[_i]);
				}
				if (_total_food>=_soldier_price && ds_map_find_value(global.resources_gather_map, global.tool_keys[1]) > 0 && ds_map_find_value(global.resources_gather_map, global.armor_keys[0]) > 0){
					_food_to_pay=_soldier_price;
					for (var _i=0; _i<array_length(global.food_keys); _i++){
						if (_food_to_pay <= ds_map_find_value(global.resources_gather_map, global.food_keys[_i])){
							global.resources_gather_map[? global.food_keys[_i]] = ds_map_find_value(global.resources_gather_map, global.food_keys[_i]) - _food_to_pay;
							break;
						}else{		
							_food_to_pay -= ds_map_find_value(global.resources_gather_map, global.food_keys[_i]);
							global.resources_gather_map[? global.food_keys[_i]] = 0;
						}
					}
					global.resources_gather_map[? global.armor_keys[0]] = ds_map_find_value(global.resources_gather_map, global.armor_keys[0]) - 1;
					global.resources_gather_map[? global.tool_keys[1]] = ds_map_find_value(global.resources_gather_map, global.tool_keys[1]) - 1;
					global.soldiers += 1;
				}else{
					_ui._text_warning="Need "+string(_soldier_price)+" more food";
					_ui._show_warning=true;
				}
			}else{
				_ui._text_warning="Need more free population.";
				_ui._show_warning=true;
			}
		}
	}
	
	// build tool menu button
	if (_ui._show_tools_menu){
		if (global.storage_space >= _ui._total_resources+1){
			if (mouse_check_button_pressed(mb_left) && _my>y_size_ui/2-15 && _my<y_size_ui/2+20 && _mx>0 && _mx<sprite_size*1.5-10){
				if (check_material_available(obj_pickaxe_lvl_0)){
					var _keys = ds_map_keys_to_array(_materials);
					for (var _i = 0; _i < array_length(_keys); _i++) {
						var _value = ds_map_find_value(_materials, _keys[_i]);
						global.resources_gather_map[? _keys[_i]] = ds_map_find_value(global.resources_gather_map, _keys[_i]) - _value;
					}	
					global.resources_gather_map[? global.tool_keys[0]] += 1;
				}else{
					_ui._text_warning="Need more materials to build pickaxe";
					_ui._show_warning=true;
				}
			}
			if (mouse_check_button_pressed(mb_left) && _my>y_size_ui/2-15+38 && _my<y_size_ui/2+20+38 && _mx>0 && _mx<sprite_size*1.5-10){
				if (check_material_available(obj_spear_lvl_0)){
					var _keys = ds_map_keys_to_array(_materials);
					for (var _i = 0; _i < array_length(_keys); _i++) {
						var _value = ds_map_find_value(_materials, _keys[_i]);
						global.resources_gather_map[? _keys[_i]] = ds_map_find_value(global.resources_gather_map, _keys[_i]) - _value;
					}	
					global.resources_gather_map[? global.tool_keys[1]] += 1;
				}else{
					_ui._text_warning="Need more materials to build spear";
					_ui._show_warning=true;
				}
			}
			if (mouse_check_button_pressed(mb_left) && _my>y_size_ui/2-15+76 && _my<y_size_ui/2+20+76 && _mx>0 && _mx<sprite_size*1.5-10){
				if (check_material_available(obj_axe_lvl_0)){
					var _keys = ds_map_keys_to_array(_materials);
					for (var _i = 0; _i < array_length(_keys); _i++) {
						var _value = ds_map_find_value(_materials, _keys[_i]);
						global.resources_gather_map[? _keys[_i]] = ds_map_find_value(global.resources_gather_map, _keys[_i]) - _value;
					}	
					global.resources_gather_map[? global.tool_keys[2]] += 1;
				}else{
					_ui._text_warning="Need more materials to build an axe";
					_ui._show_warning=true;
				}
			}
		}else{
			_ui._text_warning="Need more storage space";
			_ui._show_warning=true;
		}
	}
	
	// build armor menu button
	if (_ui._show_armors_menu){
		if (global.storage_space >= _ui._total_resources+1){
			if (mouse_check_button_pressed(mb_left) && _my>y_size_ui/2-15 && _my<y_size_ui/2+20 && _mx>0 && _mx<sprite_size*1.5-10){
				if (check_material_available(obj_leather_armor_lvl0)){
					var _keys = ds_map_keys_to_array(_materials);
					for (var _i = 0; _i < array_length(_keys); _i++) {
						var _value = ds_map_find_value(_materials, _keys[_i]);
						global.resources_gather_map[? _keys[_i]] = ds_map_find_value(global.resources_gather_map, _keys[_i]) - _value;
					}	
					global.resources_gather_map[? global.armor_keys[0]] += 1;
				}else{
					_ui._text_warning="Need more materials to build leather armor";
					_ui._show_warning=true;
				}
			}
		}else{
			_ui._text_warning="Need more storage space";
			_ui._show_warning=true;
		}
	}
	
	//build
	if (mouse_check_button_pressed(mb_left) && _ui.ui_build_selected){
		if (x < 0) x = 0; 
		if (x > room_width) x = room_width; 
		if (y < 0) y = 0; 
		if (y > room_height) y = room_height;
		if (_ui.obj_to_build_sel){
			if (mouse_x < 0 || mouse_x > room_width || mouse_y < 0 || mouse_y > room_height){
				_ui._show_warning=true;
				_ui._text_warning="Building can't be placed outside play map.";
			}else{
				if (global.pop_used<global.pop){
					global.pop_used += 1;
					vilager_build = instance_create_layer(obj_base_lvl_0.x,obj_base_lvl_0.y,"Terrain", obj_tribal_human);
					vilager_build.target_x = mouse_x;
					vilager_build.target_y = mouse_y;
					vilager_build.building_to_build = _ui.build_obj;
					vilager_build.building= true;
				
					_materials=scr_init_recepies(_ui.build_obj);
					_ui.obj_to_build_sel=false;
					_ui.build_obj=noone;
					var _keys = ds_map_keys_to_array(_materials);
					for (var _i = 0; _i < array_length(_keys); _i++) {
						var _value = ds_map_find_value(_materials, _keys[_i]);
						global.resources_gather_map[? _keys[_i]] = ds_map_find_value(global.resources_gather_map, _keys[_i]) - _value;
					}
				}else{
					_ui._text_warning = "Need more population to build"
					_ui._show_warning = true;
				}
			}
		}else{
			if (_my>200-15 && _my<200+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_house_lvl_0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_house_lvl_0;
				}else{
					_ui._text_warning="Need 5 straws resource to build a straw House";
					_ui._show_warning=true;
				}
			}
			
			if (_my>240-15 && _my<240+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_storage_lvl_0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_storage_lvl_0;
				}else{
					_ui._text_warning="Need 10 straws and 5 clay resource to build a storage";
					_ui._show_warning=true;
				}
			}
			if (_my>280-15 && _my<280+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_tool_maker_lvl_0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_tool_maker_lvl_0;
				}else{
					_ui._text_warning="Need 10 straws and 15 clay resource to build a tool maker.";
					_ui._show_warning=true;
				}
			}
			if (_my>320-15 && _my<320+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_smoke_house_lvl_0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_smoke_house_lvl_0;
				}else{
					_ui._text_warning="Need 15 straws, 25 clay, 5 stone and 10 sticks resource to build a smoker.";
					_ui._show_warning=true;
				}
			}
			if (_my>360-15 && _my<360+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_fishing_hut_lvl_0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_fishing_hut_lvl_0;
				}else{
					_ui._text_warning="Need 15 straws, 20 clay, 5 stone and 5 sticks resource to build a fishing hut.";
					_ui._show_warning=true;
				}
			}
			if (_my>400-15 && _my<400+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_herbalist_hut_lvl_0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_herbalist_hut_lvl_0;
				}else{
					_ui._text_warning="Need 10 straws, 15 clay, 5 sticks resource to build a herbalist.";
					_ui._show_warning=true;
				}
			}
			if (_my>440-15 && _my<440+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_clayworker_hut_lvl0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_clayworker_hut_lvl0;
				}else{
					_ui._text_warning="Need 8 straws, 5 clay, 5 sticks resource to build a clayworker.";
					_ui._show_warning=true;
				}
			}
			if (_my>480-15 && _my<480+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_armor_maker_lvl_0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_armor_maker_lvl_0;
				}else{
					_ui._text_warning="Need 10 straws, 10 clay, 5 stone, 5 sticks and 2 leather resource to build a armorer.";
					_ui._show_warning=true;
				}
			}
			
			if (_my>520-15 && _my<520+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_wonder_lvl0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_wonder_lvl0;
				}else{
					_ui._text_warning="Need 200 stone, 80 sticks resource to build a wonder.";
					_ui._show_warning=true;
				}
			}
		}
	}
	
	//show food inventory
	if (mouse_check_button_pressed(mb_left) && _mx>_x_start_pos+100 && _mx<_x_start_pos+195 && _my>0 && _my<sprite_size/2+10){
		if (_ui.show_food_invetory){
			_ui.show_food_invetory=false;
		}else{
			_ui.show_food_invetory=true;
		}
	}
	// show materials inventory
	if (mouse_check_button_pressed(mb_left) && _mx>_x_start_pos+195 && _mx<_x_start_pos+325 && _my>0 && _my<sprite_size/2+10){
		if (_ui.show_material_inventory){
			_ui.show_material_inventory=false;
		}else{
			_ui.show_material_inventory=true;
		}
	}
	// show tools inventory
	if (mouse_check_button_pressed(mb_left) && _mx>_x_start_pos+325 && _mx<_x_start_pos+455 && _my>0 && _my<sprite_size/2+10){
		if (_ui.show_tools_inventory){
			_ui.show_tools_inventory=false;
		}else{
			_ui.show_tools_inventory=true;
		}
	}
	// show armor inventory
	if (mouse_check_button_pressed(mb_left) && _mx>_x_start_pos+468 && _mx<_x_start_pos+598 && _my>0 && _my<sprite_size/2+10){
		if (_ui.show_armors_inventory){
			_ui.show_armors_inventory=false;
		}else{
			_ui.show_armors_inventory=true;
		}
	}
	
	//buildings_menu
	//upgarde
	if (_ui._show_building_menu && mouse_check_button_pressed(mb_left) && _mx> _ui.xpos_building_menu+20 && _mx<_ui.xpos_building_menu+175 && _my>_ui.ypos_building_menu-20 && _my<_ui.ypos_building_menu+16){
		update_succesful=update_building(_ui);	
	}
	//destory
	if (_ui._show_building_menu && mouse_check_button_pressed(mb_left) && _mx> _ui.xpos_building_menu+20 && _mx<_ui.xpos_building_menu+175 && _my>_ui.ypos_building_menu+20 && _my<_ui.ypos_building_menu+56){
		if (_ui._selected_building != instance_find(obj_base_lvl_0, 0)){
			_ui._selected_building.destory_object=true;	
			_ui._show_building_menu=false;
		}
	}
}

function check_material_available(_build_obj){
	_materials=scr_init_recepies(_build_obj)
	_materials_own = true;
	var _keys = ds_map_keys_to_array(_materials);
	for (var _i = 0; _i < array_length(_keys); _i++) {
		var _value_need = ds_map_find_value(_materials, _keys[_i]);
		var _value_own = ds_map_find_value(global.resources_gather_map, _keys[_i]);
		if (_value_need > _value_own){
			_materials_own  = false;
			break;
		}
	}
	return _materials_own;
}

function update_building(_ui){
	_building=_ui._selected_building;
	xpos=_ui._selected_building.x;
	ypos=_ui._selected_building.y;
	
	new_building = noone;
	building_valid=true;
	
	switch (_building.object_index) { 
		case obj_house_lvl_0: 
			new_building = obj_house_lvl_1; 
			break;
		case obj_tool_maker_lvl_0: 
			new_building = obj_tool_maker_lvl_1; 
			break;
		case obj_storage_lvl_0: 
			new_building = obj_storage_lvl_1; 
			break;
		default: 
			building_valid= false;
			break; 
	}
	if (building_valid){
		if (check_material_available(new_building)){
			instance_create_layer(xpos,ypos,"Terrain",new_building);
			_materials=scr_init_recepies(new_building);
			var _keys = ds_map_keys_to_array(_materials);
			for (var _i = 0; _i < array_length(_keys); _i++) {
				var _value = ds_map_find_value(_materials, _keys[_i]);
				global.resources_gather_map[? _keys[_i]] = ds_map_find_value(global.resources_gather_map, _keys[_i]) - _value;
			}
			_ui._selected_building.destory_object=true;
			_ui._show_building_menu=false;
		}else{
			_ui._text_warning="Need resource to build a mud house";
			_ui._show_warning=true;
		}
	}else{
		_ui._text_warning="No future update available.";
		_ui._show_warning=true;
	}
}