/// @description Insert description here
// You can write your code in this editor
if (!alarm_started){
	global.food_gather = global.food_gather-(global.pop*0.2);
	alarm[0]=300;
	alarm_started=true;
	if (global.food_gather < -3 && global.pop>0){
		obj_ui._text_warning = "One viliger have starved to death";
		obj_ui._show_warning = true;
		global.pop -= 1;
		global.food_gather = 0;
	}
	if (global.pop <=0){
		obj_ui._text_warning = "Game lost";
		obj_ui._show_warning = true;
		alarm[1]=120;
	}
}