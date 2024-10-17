function scr_move_humans_to_resources(_mx, _my){
	if (ui_gather_selected){
		var _resources = instance_position(_mx, _my, obj_par_resources);
		if (instance_exists(_resources) && _resources.harvested==false){
			human=instance_create_layer(obj_base_lvl0.x, obj_base_lvl0.y, "Terrain", obj_tribal_human);	
			human.target_x=_resources.x;
			human.target_y=_resources.y;
			human.human_created=true;
			human.mousex = _mx;
			human.mousey = _my;
			_resources.harvested=true;
		}
	}
}