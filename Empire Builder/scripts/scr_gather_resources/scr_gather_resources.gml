// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gather_resources(){
	var _resources = instance_position(mouse_x, mouse_y, obj_par_resources);
	if (instance_exists(_resources)){
		global.food_gather+=0.5;
	}
}