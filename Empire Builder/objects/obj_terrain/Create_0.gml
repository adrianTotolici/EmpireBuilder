/// @description Create terrain

global.back_layer=layer_create(-1);
global.back_tiles = layer_tilemap_create(global.back_layer, 0, 0, ts_terrain, room_width,room_height);
global.food_gather=0;

depth=-y;

//position x and position y to be random chosen on map
rand_x = irandom_range(0, room_width);
rand_y = irandom_range(0, room_height);
x=rand_x;
y=rand_y;
camera_set_view_pos(view_camera[0],x-window_get_width()/2,y-window_get_height()/2);
for (i=0;i<(room_width/64);i+=1) {
	for (j=0;j<(room_height/64);j+=1) {
		tilemap_set_at_pixel(global.back_tiles,irandom_range(1,3),64*i,64*j);
	}
}

instance_create_layer(x, y, "Terrain", obj_base_lvl0);
berybush = instance_create_layer(x+256, y+124, "Terrain", obj_berry_bush);