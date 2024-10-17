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
	scr_gather_resources();
	show_debug_message("resource food="+string(global.food_gather));
}