// Draw the puddle outline
draw_set_color(c_blue);
draw_ellipse(x - sprite_width / 2, y - sprite_height / 4, x + sprite_width / 2, y + sprite_height / 4, false);

// Prepare the reflection surface
if (surface_exists(reflection_surface)) {
    // Set the target to the surface
    surface_set_target(reflection_surface);
    draw_clear_alpha(0, 0); // Clear the surface

    // Draw the reflection of the player
    var player = instance_nearest(x, y, obj_player); // Replace 'obj_player' with your player object name
    if (player != noone) {
        var reflection_offset = 50; // Reflection offset below the puddle
        draw_sprite_ext(
            player.sprite_index,     // Player's sprite
            player.image_index,      // Current animation frame
            player.x - x + sprite_width / 2,  // X relative to the puddle
            player.y + reflection_offset - y + sprite_height / 2, // Y relative to the puddle
            player.image_xscale,     // Horizontal scale
            -player.image_yscale,    // Vertical flip
            player.image_angle,      // Rotation
            player.image_blend,      // Blend color
            reflection_alpha         // Transparency
        );
    }

    // Reset the drawing target
    surface_reset_target();

    // Draw the reflection, cropped by the puddle sprite
    //draw_set_blend_mode(bm_normal);
	draw_surface(reflection_surface, x - sprite_width / 2, y - sprite_height / 2)
}

draw_set_color(c_white);

if (surface_exists(reflection_surface)) {
    draw_surface(reflection_surface, 256, 256); // Draw the surface at a test position
}