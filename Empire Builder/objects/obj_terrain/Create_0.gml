/// @description Create terrain

global.back_layer=layer_create(-1);
global.back_tiles = layer_tilemap_create(global.back_layer, 0, 0, ts_terrain, room_width,room_height);

alarm_started = false;
depth=-y;
var _sprite_size=64;
var _x_sprites=room_width div _sprite_size;
var _y_sprites=room_height div _sprite_size;

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

for (a=0;a<_x_sprites;a++){
	global.terrain_resource_matrix[a] = array_create(_y_sprites,false);
}


scr_populate_map(_sprite_size);
