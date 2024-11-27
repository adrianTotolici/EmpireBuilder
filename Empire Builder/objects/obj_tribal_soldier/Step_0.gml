/// @description Insert description here
// You can write your code in this editor
event_inherited();	
		
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
		global.soldiers_used -= 1;
	}	
}

if (hp<1){
	global.soldiers -=1;
	global.soldiers_used -=1;
}


if (return_to_base){
	move_towards_point(obj_base_lvl_0.x,obj_base_lvl_0.y, speed);
	if (point_distance(x, y, obj_base_lvl_0.x, obj_base_lvl_0.y) < speed) {
		speed = 0;
		instance_destroy();
		global.soldiers_used -= 1;
		return_to_base =false;
	}		
}