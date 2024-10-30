function scr_ui_control(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	var _x_start_pos=x_size_ui/2-196;
	
	//prices
	
	//********************************************
	//** CREATURE **             PRICE          **
	//********************************************
	//********************************************
	//**  HUMAN   **          10 food           **
	//********************************************
	
	//**********************************************
	//**  BUILDINGS      **         PRICE         **
	//**********************************************
	//**********************************************
	//**  House lvl 0    **       5 grass         **
	//**********************************************
	//**  Storage lvl 0  **  10 grass ; 5 clay    **
	//**********************************************
	//**  House lvl 1    **  15 grass ; 25 clay   **
	//**********************************************
		
	var _human_price=10;

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
	
	if (mouse_check_button_pressed(mb_right)){
		_ui.ui_gather_selected=false;
	}

	// build human menu button
	if (mouse_check_button_pressed(mb_left) && _my>y_size_ui/2-15 && _my<y_size_ui/2+20 && _mx>0 && _mx<sprite_size*1.5-10 && _ui._show_base_menu){
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
	
	// build tool menu button
	if (_ui._show_tools_menu){
		if (mouse_check_button_pressed(mb_left) && _my>y_size_ui/2-15 && _my<y_size_ui/2+20 && _mx>0 && _mx<sprite_size*1.5-10){
			if (global.storage_space >= _ui._total_resources+1){
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
			}else{
				_ui._text_warning="Need more storage space";
				_ui._show_warning=true;
			}
		}
	}
	
	//build
	if (mouse_check_button_pressed(mb_left) && _ui.ui_build_selected){
		if (_ui.obj_to_build_sel){
			instance_create_layer(mouse_x,mouse_y,"Terrain",_ui.build_obj);
			_materials=scr_init_recepies(_ui.build_obj);
			_ui.obj_to_build_sel=false;
			_ui.build_obj=noone;
			var _keys = ds_map_keys_to_array(_materials);
			for (var _i = 0; _i < array_length(_keys); _i++) {
				var _value = ds_map_find_value(_materials, _keys[_i]);
				global.resources_gather_map[? _keys[_i]] = ds_map_find_value(global.resources_gather_map, _keys[_i]) - _value;
			}	
		}else{
			if (_my>200-15 && _my<200+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_house_lvl_0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_house_lvl_0;
				}else{
					_ui._text_warning="Need resource to build a straw House";
					_ui._show_warning=true;
				}
			}
			
			if (_my>240-15 && _my<240+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_storage_lvl_0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_storage_lvl_0;
				}else{
					_ui._text_warning="Need resource to build a storage";
					_ui._show_warning=true;
				}
			}
			if (_my>280-15 && _my<280+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_house_lvl_1)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_house_lvl_1;
				}else{
					_ui._text_warning="Need resource to build a mud house";
					_ui._show_warning=true;
				}
			}
			if (_my>320-15 && _my<320+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
				if (check_material_available(obj_tool_maker_lvl_0)){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=obj_tool_maker_lvl_0;
				}else{
					_ui._text_warning="Need resource to build a tool maker.";
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