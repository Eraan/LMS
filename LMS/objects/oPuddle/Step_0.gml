// Check if the surface exists, recreate if needed
if (!surface_exists(reflection_surface)) {
    reflection_surface = surface_create(sprite_width, sprite_height);
}

// Check for the player instance
var player = instance_nearest(x, y, obj_player); // Replace 'obj_player' with your player object name
if (player != noone && point_in_circle(player.x, player.y, x, y, sprite_width)) {
    player_nearby = true;
} else {
    player_nearby = false;
}