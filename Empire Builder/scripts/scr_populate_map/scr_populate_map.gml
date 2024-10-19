// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_populate_map(_sprite_size){
	instance_create_layer(x, y, "Terrain", obj_base_lvl0);
	
	for (i=2;i<array_length(global.terrain_resource_matrix)-2;i++){
		for (j=2;j<array_length(global.terrain_resource_matrix[i])-2;j++){
			if (global.terrain_resource_matrix[i][j] != true){
				resource_freq=random_range(1,100);
				if (resource_freq>0 && resource_freq<=4){
					instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_berry_bush);
					global.terrain_resource_matrix[i][j] = true;
				}
				if (resource_freq>10 && resource_freq<=12){
					instance_create_layer(i*_sprite_size,j*_sprite_size,"Terrain",obj_grass_bush);
					global.terrain_resource_matrix[i][j] = true;
				}
			}
		}
	}
}