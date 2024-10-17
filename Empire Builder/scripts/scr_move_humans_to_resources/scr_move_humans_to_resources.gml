function scr_move_humans_to_resources(){
	if (ui_gather_selected){
		var _resources = instance_position(mouse_x, mouse_y, obj_par_resources);
		if (instance_exists(_resources) && _resources.harvested==false){
			human=instance_create_layer(obj_base_lvl0.x, obj_base_lvl0.y, "Terrain", obj_tribal_human);	
			human.target_x=_resources.x;
			human.target_y=_resources.y;
			human.human_created=true;
			_resources.harvested=true;
		}
	}
}