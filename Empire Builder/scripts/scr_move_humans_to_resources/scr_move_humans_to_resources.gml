function scr_move_humans_to_resources(_mx, _my){
	var _ui=obj_ui;
	if (_ui.ui_gather_selected && global.pop-global.pop_used >0){
		var _resources = instance_position(_mx, _my, obj_par_resources);
		if (instance_exists(_resources) && _resources.harvested==false){
			human=instance_create_layer(obj_base_lvl0.x, obj_base_lvl0.y, "Terrain", obj_tribal_human);	
			human.target_x=_resources.x;
			human.target_y=_resources.y;
			human.human_created=true;
			human.mousex = _mx;
			human.mousey = _my;
			_resources.harvested=true;
			global.pop_used += 1;
			_ui.ui_gather_selected=false;
		}
	}
}