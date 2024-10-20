/// @description Insert description here
// You can write your code in this editor

if(human_created){
	speed =  0.5;
}else{
	speed =0;
}

move_towards_point(target_x, target_y, speed);
if (point_distance(x, y, target_x, target_y) < speed) {
	speed = 0;
	instance_destroy();
	var _resources = instance_position(target_x, target_y-10, obj_par_resources);
	var _base = instance_position(target_x,target_y-10,obj_base_lvl_0);
	if (instance_exists(_resources)){
		_resources.ocupied=true;
	}
	if (instance_exists(_base)){
		global.pop_used -= 1;
	}
}