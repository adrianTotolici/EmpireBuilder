/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (state_gather){
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
}		
		
if (finish_fight && state_attack == false && start_fight == false){
	if (speed ==0 ) {
		speed = 0.5;
	}
	var _posx=0;
	var _posy=0;
	if (base_posx>0 && base_posy >0){
		_posx=base_posx;
		_posy=base_posy;
	}else{
		if (target_x >0 && target_y >0){
			_posx=target_x;
		    _posy=target_y;
		}
	}
	move_towards_point(_posx, _posy, speed);
	if (point_distance(x, y, _posx, _posy) < speed) {
		speed = 0;
		instance_destroy();
		global.pop_used -= 1;
	}	
}

if (hp<1){
	global.pop -=1;
	global.pop_used -=1;
	if (target_x >0 && target_y >0){
		var _resources = instance_position(target_x, target_y-10, obj_par_resources);
		if (instance_exists(_resources)){
			_resources.harvested=false;
		}
	}
}