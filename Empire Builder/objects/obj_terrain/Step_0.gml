/// @description Insert description here
// You can write your code in this editor
if (!alarm_started){
	var _food_eaten=global.pop*1;
	var _total_food = 0;
	for (var _i=0; _i<array_length(global.food_keys); _i++){
		_total_food += ds_map_find_value(global.resources_gather_map, global.food_keys[_i]);
	}
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
		obj_ui._text_warning = "Game lost";
		obj_ui._show_warning = true;
		alarm[1]=120;
	}
}