/// @description Insert description here
event_inherited();

var _nearest_target = instance_nearest(x, y, obj_tribal_human);

if (_nearest_target<0){
	if (random(1000) < 2) { // 0.2% chance to change direction each step
		direction = irandom(360); // Set a new random direction
	}
}

if (_nearest_target >0 && state_attack == false) {
    var _distance = point_distance(x, y,_nearest_target.x, _nearest_target.y);
    if (_distance < range) {
        show_debug_message("Target is within range.");
		if (state_attack == false){
			speed=0.55
			state_attack= true;
			creature_to_attack=_nearest_target;
		}
    }else {
	    if (random(1000) < 2) { // 0.2% chance to change direction each step
			direction = irandom(360); // Set a new random direction
		}
	}
}
