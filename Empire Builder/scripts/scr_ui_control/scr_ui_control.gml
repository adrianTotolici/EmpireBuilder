function scr_ui_control(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	
	//prices
	//human 10 food;
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
				_ui._text_warning="No more population"
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
		if (global.food_gather>=_human_price){
			global.food_gather -=_human_price;
			global.pop += 1;
		}
	}
	
	//build house_button
	if (mouse_check_button_pressed(mb_left) && _ui.ui_build_selected){
		if (_ui.obj_to_build_sel){
			instance_create_layer(mouse_x,mouse_y,"Terrain",obj_house_lvl_0);
			_ui.obj_to_build_sel=false;
			_ui.build_obj=noone;
			global.resources_gather -=5;
		}else{
			if (global.resources_gather >=5){
				if (_my>200-15 && _my<200+20 && _mx>x_size_ui-(sprite_size*2)-40 && _mx<x_size_ui){
					_ui.obj_to_build_sel=true;
					_ui.build_obj=spr_house_lvl0;
				}
			}else{
				_ui._text_warning="Need 5 resource to build House"
				_ui._show_warning=true;
			}
		}
	}	
}