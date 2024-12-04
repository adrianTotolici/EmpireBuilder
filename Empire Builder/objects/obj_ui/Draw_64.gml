/// @description draw play gui
draw_set_font(fnt_ui);
draw_set_color(c_black);
draw_text(0, 0,_text_to_display);
if (show_debug){
	draw_text(0, 20, "FPS = " + string(fps));
}
// Draw ui buttons
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui-(sprite_size*ui_button_scale),(sprite_size/2),ui_button_scale,1,0,c_white,1);
draw_text(x_size_ui-(sprite_size*ui_button_scale)/2-25,(sprite_size/2)-8,_text_menu_button);

// Draw ui interact buttons gather
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui/2,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
draw_sprite_ext(spr_ui_gather,0,x_size_ui/2,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
if (ui_gather_selected){
	draw_sprite_ext(spr_ui_select,0,x_size_ui/2,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
}

//Draw ui interact buttons build
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui/2+sprite_size,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
draw_sprite_ext(spr_ui_build,0,x_size_ui/2+sprite_size+5,y_size_ui-(sprite_size/2),0.8,0.8,0,c_white,1);
if (ui_build_selected){
	draw_sprite_ext(spr_ui_select,0,x_size_ui/2+sprite_size,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
}

//Draw ui interact buttons attack
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui/2+sprite_size*2,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
draw_sprite_ext(spr_ui_attack,0,x_size_ui/2+sprite_size*2+8,y_size_ui-(sprite_size/2)-3,0.65,0.65,0,c_white,1);
if (ui_attack_selected){
	draw_sprite_ext(spr_ui_select,0,x_size_ui/2+sprite_size*2,y_size_ui-(sprite_size/2),1,1,0,c_white,1);
}

var _x_pos_start=x_size_ui/2-196;

//Draw soldier info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start-sprite_size*1.5-100,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_soldier,0,_x_pos_start-175,22,0.4,0.4,0,c_white,1);
draw_text(_x_pos_start-145,12,string(floor(global.soldiers_used))+"/"+string(floor(global.soldiers)));

//Draw pop info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start-sprite_size*1.5,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_population,0,_x_pos_start-75,22,0.4,0.4,0,c_white,1);
draw_text(_x_pos_start-45,12,string(floor(global.pop_used))+"/"+string(floor(global.pop)));

// Draw building info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_house,0,_x_pos_start+25,20,0.5,0.5,0,c_white,1);
draw_text(_x_pos_start+64,12,string(floor(global.house)));

// Draw food info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+100,sprite_size/2-10,1.5,1,0,c_white,1);
draw_sprite_ext(spr_ui_food,0,_x_pos_start+130,20,0.5,0.5,0,c_white,1);
draw_text(_x_pos_start+164,12,string(floor(_total_food)));

// Draw resources info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+200,sprite_size/2-10,2,1,0,c_white,1);
draw_sprite_ext(spr_ui_materials,0,_x_pos_start+230,5,0.8,0.8,0,c_white,1);
draw_text(_x_pos_start+264,12,string(floor(_total_resources))+"/"+string(floor(global.storage_space)));

// Draw tools info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+332,sprite_size/2-10,2,1,0,c_white,1);
draw_sprite_ext(spr_ui_tools,0,_x_pos_start+360,14,0.8,0.8,0,c_white,1);
draw_text(_x_pos_start+420,12,string(floor(_total_tools)));

// Draw armors info
draw_set_color(c_white);
draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+468,sprite_size/2-10,2,1,0,c_white,1);
draw_sprite_ext(spr_ui_armors,0,_x_pos_start+490,25,0.8,0.8,0,c_white,1);
draw_text(_x_pos_start+560,12,string(floor(_total_armors)));
	
//Show warning
if (_show_warning) {
	draw_set_color(c_white);
	draw_text_ext_transformed(x_size_ui/2-100,100,_text_warning,10,300,2,2,0);
}
	
//show base menu
if (_show_base_menu){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_grey_background,0,0,y_size_ui/2,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_population,0,sprite_size/2,y_size_ui/2,0.5,0.5,0,c_white,1);
	draw_text(55,y_size_ui/2-7,"+ 1")
	
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_grey_background,0,0,y_size_ui/2-50,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_soldier,0,sprite_size/2,y_size_ui/2-50,0.5,0.5,0,c_white,1);
	draw_text(55,y_size_ui/2-57,"+ 1")
}

//show tools menu
if (_show_tools_menu){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_grey_background,0,0,y_size_ui/2+38,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_spear_0,0,sprite_size/2,y_size_ui/2+52,0.45,0.45,0,c_white,1);
	draw_text(55,y_size_ui/2+25,"+ 1");
	
	if (_clicked_building == obj_tool_maker_lvl_1) {
		draw_sprite_ext(spr_ui_button_grey_background,0,0,y_size_ui/2,1.5,1,0,c_white,1);
		draw_sprite_ext(spr_ui_pickaxe_0,0,sprite_size/2,y_size_ui/2+13,0.45,0.45,0,c_white,1);
		draw_text(55,y_size_ui/2-6,"+ 1");
	
		draw_sprite_ext(spr_ui_button_grey_background,0,0,y_size_ui/2+76,1.5,1,0,c_white,1);
		draw_sprite_ext(spr_ui_axe_0,0,sprite_size/2-20,y_size_ui/2+89,0.45,0.45,0,c_white,1);
		draw_text(55,y_size_ui/2+66,"+ 1");
	}
}

//show armor menu
if (_show_armors_menu){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_grey_background,0,0,y_size_ui/2,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_leather_armor,0,sprite_size/2,y_size_ui/2+13,0.45,0.45,0,c_white,1);
	draw_text(55,y_size_ui/2-6,"+ 1");
}

//show build menu
if (ui_build_selected){
	var _col=c_white;
	if (not check_material_available(obj_house_lvl_0)){
		_col=c_grey;
	}else{
		_col=c_white;
	}
	draw_set_color(_col);
	draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui-(sprite_size*2)-40,200,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_house_lvl0_2,0,x_size_ui-(sprite_size*2),200,0.5,0.5,0,_col,1);
	draw_text(x_size_ui-sprite_size-35,200-7,"straw house")
	
	if (not check_material_available(obj_storage_lvl_0)){
		_col=c_grey;
	}else{
		_col=c_white;
	}
	draw_set_color(_col);
	draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui-(sprite_size*2)-40,240,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_storage_lvl0_2,0,x_size_ui-(sprite_size*2),235,0.5,0.5,0,_col,1);
	draw_text(x_size_ui-sprite_size-35,240-7,"storage")
	
	if (not check_material_available(obj_tool_maker_lvl_0)){
		_col=c_grey;
	}else{
		_col=c_white;
	}
	draw_set_color(_col);
	draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui-(sprite_size*2)-40,280,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_tool_make_lvl0_2,0,x_size_ui-(sprite_size*2),275,0.5,0.5,0,_col,1);
	draw_text(x_size_ui-sprite_size-35,280-7,"tool maker")
	
	if (not check_material_available(obj_smoke_house_lvl_0)){
		_col=c_grey;
	}else{
		_col=c_white;
	}
	draw_set_color(_col);
	draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui-(sprite_size*2)-40,320,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_smoke_house_lvl0_2,0,x_size_ui-(sprite_size*2),320,0.5,0.5,0,_col,1);
	draw_text(x_size_ui-sprite_size-35,320-7,"smoke house")
	
	if (not check_material_available(obj_fishing_hut_lvl_0)){
		_col=c_grey;
	}else{
		_col=c_white;
	}
	draw_set_color(_col);
	draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui-(sprite_size*2)-40,360,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_fish_hut_lvl_2,0,x_size_ui-(sprite_size*2),355,0.5,0.5,0,_col,1);
	draw_text(x_size_ui-sprite_size-35,360-7,"fishing hut")
	
	if (not check_material_available(obj_herbalist_hut_lvl_0)){
		_col=c_grey;
	}else{
		_col=c_white;
	}
	draw_set_color(_col);
	draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui-(sprite_size*2)-40,400,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_herbalist_hut_lvl0_2,0,x_size_ui-(sprite_size*2),395,0.5,0.5,0,_col,1);
	draw_text(x_size_ui-sprite_size-35,400-7,"herbalist hut")
	
	if (not check_material_available(obj_clayworker_hut_lvl0)){
		_col=c_grey;
	}else{
		_col=c_white;
	}
	draw_set_color(_col);
	draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui-(sprite_size*2)-40,440,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_clayworker_hut_lvl0_2,0,x_size_ui-(sprite_size*2),435,0.5,0.5,0,_col,1);
	draw_text(x_size_ui-sprite_size-35,440-7,"clayworker")
	
	if (not check_material_available(obj_armor_maker_lvl_0)){
		_col=c_grey;
	}else{
		_col=c_white;
	}
	draw_set_color(_col);
	draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui-(sprite_size*2)-40,480,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_armorer_lvl0_2,0,x_size_ui-(sprite_size*2),478,0.5,0.5,0,_col,1);
	draw_text(x_size_ui-sprite_size-35,480-7,"armorer")
	
	if (not check_material_available(obj_wonder_lvl0)){
		_col=c_grey;
	}else{
		_col=c_white;
	}
	draw_set_color(_col);
	draw_sprite_ext(spr_ui_button_grey_background,0,x_size_ui-(sprite_size*2)-40,520,2.7,1,0,c_white,1);
	draw_sprite_ext(spr_wonder_lvl0_2,0,x_size_ui-(sprite_size*2),521,0.5,0.5,0,_col,1);
	draw_text(x_size_ui-sprite_size-35,520-7,"wonder")
}

if (obj_to_build_sel){
	draw_sprite_ext(object_get_sprite(build_obj),0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),1,1,0,c_white,0.5);
}

if (show_food_invetory){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+100,sprite_size/2+32,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_berry,0,_x_pos_start+120,sprite_size/2+45,0.4,0.4,0,c_white,1);
	draw_text(_x_pos_start+150,sprite_size/2+20,string(floor(ds_map_find_value(global.resources_gather_map, global.food_keys[0]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+100,sprite_size+45,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_fish,0,_x_pos_start+120,sprite_size+55,0.65,0.65,0,c_white,1);
	draw_text(_x_pos_start+150,sprite_size+35,string(floor(ds_map_find_value(global.resources_gather_map, global.food_keys[1]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+100,sprite_size+90,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_herbs,0,_x_pos_start+120,sprite_size+105,0.45,0.45,0,c_white,1);
	draw_text(_x_pos_start+150,sprite_size+82,string(floor(ds_map_find_value(global.resources_gather_map, global.food_keys[2]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+100,sprite_size+135,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_mushroom,0,_x_pos_start+120,sprite_size+149,0.45,0.45,0,c_white,1);
	draw_text(_x_pos_start+150,sprite_size+129,string(floor(ds_map_find_value(global.resources_gather_map, global.food_keys[3]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+100,sprite_size+180,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_meat,0,_x_pos_start+120,sprite_size+195,0.45,0.45,0,c_white,1);
	draw_text(_x_pos_start+150,sprite_size+170,string(floor(ds_map_find_value(global.resources_gather_map, global.food_keys[4]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+100,sprite_size+225,1.5,1,0,c_white,1);
	draw_sprite_ext(spr_ui_smoked_meat,0,_x_pos_start+120,sprite_size+240,0.5,0.5,0,c_white,1);
	draw_text(_x_pos_start+150,sprite_size+215,string(floor(ds_map_find_value(global.resources_gather_map, global.food_keys[5]))));
}

if (show_material_inventory){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+200,sprite_size/2+32,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_grass,0,_x_pos_start+230,sprite_size/2+45,0.45,0.45,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size/2+20,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[0]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+200,sprite_size+45,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_clay,0,_x_pos_start+230,sprite_size+57,0.45,0.45,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size+35,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[1]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+200,sprite_size+90,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_stone,0,_x_pos_start+230,sprite_size+105,0.45,0.45,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size+82,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[2]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+200,sprite_size+135,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_stick,0,_x_pos_start+230,sprite_size+149,0.5,0.5,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size+129,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[3]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+200,sprite_size+180,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_flint,0,_x_pos_start+230,sprite_size+190,0.5,0.5,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size+173,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[4]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+200,sprite_size+225,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_bone,0,_x_pos_start+230,sprite_size+236,0.5,0.5,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size+220,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[5]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+200,sprite_size+270,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_hide,0,_x_pos_start+230,sprite_size+285,0.4,0.4,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size+265,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[6]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+200,sprite_size+315,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_wood,0,_x_pos_start+230,sprite_size+325,0.4,0.4,0,c_white,1);
	draw_text(_x_pos_start+270,sprite_size+310,string(floor(ds_map_find_value(global.resources_gather_map, global.resources_keys[7]))));
}

if (show_tools_inventory){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+332,sprite_size/2+32,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_pickaxe_0,0,_x_pos_start+360,sprite_size/2+45,0.45,0.45,0,c_white,1);
	draw_text(_x_pos_start+385,sprite_size/2+20,string(floor(ds_map_find_value(global.resources_gather_map, global.tool_keys[0]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+332,sprite_size+45,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_spear_0,0,_x_pos_start+360,sprite_size+57,0.45,0.45,0,c_white,1);
	draw_text(_x_pos_start+385,sprite_size+35,string(floor(ds_map_find_value(global.resources_gather_map, global.tool_keys[1]))));
	
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+332,sprite_size+90,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_axe_0,0,_x_pos_start+350,sprite_size+105,0.45,0.45,0,c_white,1);
	draw_text(_x_pos_start+385,sprite_size+82,string(floor(ds_map_find_value(global.resources_gather_map, global.tool_keys[2]))));
	
}

if (show_armors_inventory){
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_button_grey_background,0,_x_pos_start+468,sprite_size/2+32,2,1,0,c_white,1);
	draw_sprite_ext(spr_ui_leather_armor,0,_x_pos_start+490,sprite_size/2+45,0.45,0.45,0,c_white,1);
	draw_text(_x_pos_start+560,sprite_size/2+20,string(floor(ds_map_find_value(global.resources_gather_map, global.armor_keys[0]))));
}

if (_show_building_menu){
	draw_set_color(c_white);
	
	draw_sprite_ext(spr_ui_button_grey_background,0,xpos_building_menu+20,ypos_building_menu,2.6,1,0,c_white,1);
	draw_text(xpos_building_menu+32,ypos_building_menu-10,"Update building");
	if (_selected_building != instance_find(obj_base_lvl_0, 0) && _selected_building != instance_find(obj_base_lvl_1, 0)){
		draw_sprite_ext(spr_ui_button_grey_background,0,xpos_building_menu+20,ypos_building_menu+40,2.6,1,0,c_white,1);
		draw_text(xpos_building_menu+32,ypos_building_menu+32,"Destroy building");
	}
}