draw_self();

var mx = device_mouse_x(0);
var my = device_mouse_y(0);
//var chooseTimeToChop = irandom_range(120, 640) / global.userLevels.forestry;
var outline_color = c_white; // Outline color
var outline_thickness = .5;  // How thick the outline is

var nearest_player = instance_nearest(x, y, obj_player);
var distanceFromPlayer = point_distance(nearest_player.x, nearest_player.y, x, y);
var player_device = nearest_player.local_data[$ "input_device"];
var player_rd = nearest_player.local_data[$ "player_order"];
var player_controller = nearest_player.local_data[$ "controlls"];

if (state == tree.IDLE) {
	// Player Initial Interaction
	if (distanceFromPlayer <= 18) {
		// Outline
		gpu_set_fog(true, outline_color, 0, 0);
		draw_sprite_ext(sprite_index, image_index, x - outline_thickness, y - outline_thickness, 1, 1, 0, outline_color, .75); // Top-left
		draw_sprite_ext(sprite_index, image_index, x + outline_thickness, y - outline_thickness, 1, 1, 0, outline_color, .75); // Top-right
		draw_sprite_ext(sprite_index, image_index, x - outline_thickness, y + outline_thickness, 1, 1, 0, outline_color, .75); // Bottom-left
		draw_sprite_ext(sprite_index, image_index, x + outline_thickness, y + outline_thickness, 1, 1, 0, outline_color, .75); // Bottom-right
		gpu_set_fog(false, outline_color, 0, 0);
		
		draw_sprite_ext(sprite_index, 2, x, y, 1, 1, 0, c_white, 1);
		
		draw_self();
		
		if (player_controller == "Keyboard") {
			draw_sprite_ext(sPressF, 0, x + 16, y - 0, .5, .5, 0, c_white, 1);
		} else if (player_controller == "Gamepad") {
			draw_sprite_ext(sPressX, 0, x + 16, y - 0, .5, .5, 0, c_white, 1);
		}
	} else {
		draw_sprite_ext(sprite_index, 2, x, y, 1, 1, 0, c_white, 1);
		
		draw_self();
	}
} else if (state == tree.CHOPPING) {
	draw_sprite_ext(sprite_index, 2, x, y, 1, 1, 0, c_white, 1);
		
	draw_self();
}