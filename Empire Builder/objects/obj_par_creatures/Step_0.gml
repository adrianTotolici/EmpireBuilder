/// @description Insert description here
// You can write your code in this editor

if (state_attack && creature_to_attack>0){
	if (creature_to_attack>0 && instance_exists(creature_to_attack)){
		move_towards_point(creature_to_attack.x,creature_to_attack.y, speed);
		if (point_distance(x, y, creature_to_attack.x, creature_to_attack.y) < 8) {
			speed = 0;
			creature_to_attack.speed=0;
			creature_to_attack.state_attack=true;
			creature_to_attack.creature_to_attack=id;
			
			if (!start_fight){
				alarm[0]=200;
				start_fight=true;
			}
		}
	}else{
		state_attack=false;
		start_fight=false;
		finish_fight = true;
	}
}

if (hp<1){
	instance_destroy();
}

if (x < 0) x = 0; 
if (x > room_width) x = room_width; 
if (y < 0) y = 0; 
if (y > room_height) y = room_height;
