/// @description Attack frame
if (state_attack){
	creature_to_attack.hp =creature_to_attack.hp- (atk-creature_to_attack.def);
	alarm[0]=200;
}