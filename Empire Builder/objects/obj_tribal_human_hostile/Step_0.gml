/// @description Insert description here
event_inherited();
if (random(1000) < 2) { // 0.2% chance to change direction each step
    direction = irandom(360); // Set a new random direction
}