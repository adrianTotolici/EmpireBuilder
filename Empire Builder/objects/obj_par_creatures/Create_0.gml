/// @description Insert description here
// You can write your code in this editor
depth=obj_terrain.depth-2;
speed =  0.5; 

spr_side=noone;
spr_up=noone;
spr_down=noone;
spr_stand=noone;
spr_attack=noone;

xscale=1;
yscale=1;

image_xscale=xscale;
image_yscale=yscale;

state_gather = false;
state_attack = false;
state_defense = false;

creature_to_attack = noone;
creature_to_defend = noone;

max_health=10;
hp=max_health;
atk=1;
def=0;

start_fight =false;
finish_fight = false;
base_posx=noone;
base_posy=noone;