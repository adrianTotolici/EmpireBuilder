/// @description Insert description here
// You can write your code in this editor
if (destory_object){
	instance_destroy();
}

if (hp<1){
	instance_destroy();
}

if (not building_started){
	alarm[1]=250;
	building_started = true;
}