/// @description Insert description here
// You can write your code in this editor
var _base = instance_position(target_x,target_y-10,obj_base_lvl_0);

if (state_gather){
	move_towards_point(target_x, target_y, speed);
	if (point_distance(x, y, target_x, target_y) < speed) {
		speed = 0;
		instance_destroy();
		var _resources = instance_position(target_x, target_y-10, obj_par_resources);
		
		if (instance_exists(_resources)){
			_resources.ocupied=true;
		}
		if (instance_exists(_base)){
			global.pop_used -= 1;
		}
	}	
}

if (state_attack && creature_to_attack>0){
	if (creature_to_attack>0 && instance_exists(creature_to_attack)){
		move_towards_point(creature_to_attack.x,creature_to_attack.y, speed);
		if (point_distance(x, y, creature_to_attack.x, creature_to_attack.y) < 8) {
			speed = 0;
			creature_to_attack.speed=0;
			if (!start_fight){
				alarm[0]=200;
				start_fight=true;
			}
		}
	}else{
		state_attack=false;
		start_fight=false;
	}
}

if (hp<1){
	instance_destroy();
}
