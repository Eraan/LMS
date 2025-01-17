var mx = device_mouse_x(0); 
var my = device_mouse_y(0);

var outline_color = c_aqua; // Outline color
var outline_thickness = .5;  // How thick the outline is
var distanceFromPlayer = point_distance(player.x, player.y, x, y);

draw_text_transformed(x + 16, y, image_speed, .25, .25, 0);

if (distanceFromPlayer <= 20) and (point_in_rectangle(mx, my, x, y, x + 16, y + 16)) and (state = pillar.ERECT) {
	gpu_set_fog(true, outline_color, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x - outline_thickness, y - outline_thickness, 1, 1, 0, outline_color, .75); // Top-left
	draw_sprite_ext(sprite_index, image_index, x + outline_thickness, y - outline_thickness, 1, 1, 0, outline_color, .75); // Top-right
	draw_sprite_ext(sprite_index, image_index, x - outline_thickness, y + outline_thickness, 1, 1, 0, outline_color, .75); // Bottom-left
	draw_sprite_ext(sprite_index, image_index, x + outline_thickness, y + outline_thickness, 1, 1, 0, outline_color, .75); // Bottom-right
	gpu_set_fog(false, outline_color, 0, 0);
}

draw_self();