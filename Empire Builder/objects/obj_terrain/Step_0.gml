/// @description Insert description here
// You can write your code in this editor
if (!alarm_started){
	global.food_gather = global.food_gather-(global.pop*0.2);
	alarm[0]=300;
	alarm_started=true;
}