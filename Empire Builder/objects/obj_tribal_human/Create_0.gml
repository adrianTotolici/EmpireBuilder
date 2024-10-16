/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

target_x = 0; // X coordinate of point B
target_y = 0; // Y coordinate of point B
speed =  0.5; // Speed of the object

// In the Step event
move_towards_point(target_x, target_y, speed);

// Stop the object when it reaches the target
if (point_distance(x, y, target_x, target_y) < speed) {
    speed = 0;
}
