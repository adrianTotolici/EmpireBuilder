/// @description Insert description here
event_inherited();

if (state_attack == false){
	var _nearest_target = instance_nearest(x, y, obj_tribal_human);
	var _nearest_building = instance_nearest(x, y, obj_par_buildings);
	if (_nearest_target >0) {
	    var _distance = point_distance(x, y,_nearest_target.x, _nearest_target.y);
	    if (_distance < range) {
	        show_debug_message("Target is within range.");
			if (state_attack == false){
				speed=0.55
				state_attack= true;
				creature_to_attack=_nearest_target;
			}
	    }
	}
	if (_nearest_building >0 && not _nearest_building.enemy_building){
		var _distance = point_distance(x, y,_nearest_building.x, _nearest_building.y);
		if (_distance < range) {
			show_debug_message("Target is within range.");
			if (state_attack == false){
				speed=0.55
				state_attack= true;
				creature_to_attack=_nearest_building;
			}
		}
	}
	if (speed == 0){
		speed = 0.5;
		state_attack=false;
		start_fight=false;
		finish_fight = true;
		creature_to_attack=noone;
	}
	if (random(1000) < 2) { // 0.2% chance to change direction each step
		direction = irandom(360); // Set a new random direction
	}
}
