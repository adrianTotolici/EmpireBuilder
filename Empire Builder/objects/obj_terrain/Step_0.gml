/// @description Insert description here
if (!alarm_started){
	var _food_eaten=global.pop*0.01;
	for (var _i=0; _i<array_length(global.food_keys); _i++){
		if (_food_eaten <= ds_map_find_value(global.resources_gather_map, global.food_keys[_i])){
			global.resources_gather_map[? global.food_keys[_i]] = ds_map_find_value(global.resources_gather_map, global.food_keys[_i]) - _food_eaten;
			_food_eaten = 0;
			break;
		}else{		
			_food_eaten -= ds_map_find_value(global.resources_gather_map, global.food_keys[_i]);
			global.resources_gather_map[? global.food_keys[_i]] = 0;
		}
	}
	
	alarm[0]=300;
	alarm_started=true;
	
	if (_food_eaten > 0 && global.pop>0){
		obj_ui._text_warning = "One viliger have starved to death";
		obj_ui._show_warning = true;
		global.pop -= 1;
	}
	if (global.pop <=0){
		var _total_food = 0
		for (var _i=0; _i<array_length(global.food_keys); _i++){
			_total_food += ds_map_find_value(global.resources_gather_map, global.food_keys[_i]);
		}
		if (_total_food < 10){
			global.game_lost=true;
		}
	}
	if (global.game_lost){
		obj_ui._text_warning = "Game lost";
		obj_ui._show_warning = true;
		alarm[1]=200;
		global.game_lost = false;
	}
	if (global.game_win){
		obj_ui._text_warning = "Game won. You have progressed to next age.";
		obj_ui._show_warning = true;
		alarm[2]=200;
		global.game_win = false;
	}
}