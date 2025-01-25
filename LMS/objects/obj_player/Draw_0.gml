// Draw Outline
/*
var outline_color = c_white; // Outline color
var outline_thickness = .5;  // How thick the outline is
	
gpu_set_fog(true, outline_color, 0, 0);
draw_sprite_ext(sprite_index, image_index, x - outline_thickness, y - outline_thickness, 1, 1, 0, outline_color, .75); // Top-left
draw_sprite_ext(sprite_index, image_index, x + outline_thickness, y - outline_thickness, 1, 1, 0, outline_color, .75); // Top-right
draw_sprite_ext(sprite_index, image_index, x - outline_thickness, y + outline_thickness, 1, 1, 0, outline_color, .75); // Bottom-left
draw_sprite_ext(sprite_index, image_index, x + outline_thickness, y + outline_thickness, 1, 1, 0, outline_color, .75); // Bottom-right
gpu_set_fog(false, outline_color, 0, 0);
*/

if (!dead) {
	draw_set_alpha(.25);
	draw_rectangle_color(x + 4, y + 14, x + 12, y + 14, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(x + 3, y + 15, x + 13, y + 15, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(x + 4, y + 16, x + 12, y + 16, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
}

draw_self();

if (global.game_state == "Paused") {
	exit;	
}


var player_count = variable_struct_names_count(global.player_data);

// Visual Aiming for Players
for (var i = 0; i < player_count; i++) {
	var controlls = global.player_data[$ i][$ "controlls"];
	var device = global.player_data[$ i][$ "input_device"];
	var player_instance = global.player_data[$ i][$ "player_instance"];

	if (controlls == "Gamepad") {
		gamepad_set_axis_deadzone(device, 0.1);
		var haxis = gamepad_axis_value(device, gp_axisrh);
		var vaxis = gamepad_axis_value(device, gp_axisrv);
	
		if (haxis == 0) and (vaxis == 0) {
		
		} else {
			var dead_zone = 0.1;
			if (abs(haxis) < dead_zone) haxis = 0;
			if (abs(vaxis) < dead_zone) vaxis = 0;

			var target_x = player_instance.x + haxis * 100; // Scale the direction to a reasonable distance
			var target_y = player_instance.y + vaxis * 100; // Scale sa direction to a reasonable distance

			var pointer_dir = point_direction(player_instance.x + 8, player_instance.y + 8, target_x, target_y) - 135;

			draw_sprite_ext(sPointer, 0, player_instance.x + 8, player_instance.y + 8, 1, 1, pointer_dir, c_white, .50);
		}
	} else  {
		var target_x = device_mouse_x(0);
		var target_y = device_mouse_y(0);

		var pointer_dir = point_direction(player_instance.x + 8, player_instance.y + 8, target_x, target_y) - 135;

		draw_sprite_ext(sPointer, 0, player_instance.x + 8, player_instance.y + 8, 1, 1, pointer_dir, c_white, .50);
	}
}

/*
if (!isStructEmpty(weapon)) {
	var weaponIcon = weapon[$ "sprite"];
	draw_sprite_ext(weaponIcon, 0, x - 4, y, .25, .25, 0, c_white, 1);
}*/

