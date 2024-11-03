/// @description Attack frame
if (state_attack){
	creature_to_attack.hp -= atk;
	alarm[0]=200;
}