var mx = device_mouse_x(0);
var my = device_mouse_y(0);

var outline_color = c_white; // Outline color
var outline_thickness = .5;  // How thick the outline is

var nearest_player = instance_nearest(x, y, obj_player);
var distanceFromPlayer = point_distance(nearest_player.x, nearest_player.y, x, y);
var player_rd = nearest_player.local_data[$ "player_order"];
var player_device = nearest_player.local_data[$ "input_device"];
var player_controller = nearest_player.local_data[$ "controlls"];
var player_gold = nearest_player.local_data.gold;

//draw_text_transformed(x, y, alarm[0], .25, .25, 0);
//draw_text_transformed(x, y - 16, state, .25, .25, 0);
		
if (state == planter.EMPTY) and (distanceFromPlayer <= 8) {
	// Outline
	gpu_set_fog(true, outline_color, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x - outline_thickness, y - outline_thickness, 1, 1, 0, outline_color, .75); // Top-left
	draw_sprite_ext(sprite_index, image_index, x + outline_thickness, y - outline_thickness, 1, 1, 0, outline_color, .75); // Top-right
	draw_sprite_ext(sprite_index, image_index, x - outline_thickness, y + outline_thickness, 1, 1, 0, outline_color, .75); // Bottom-left
	draw_sprite_ext(sprite_index, image_index, x + outline_thickness, y + outline_thickness, 1, 1, 0, outline_color, .75); // Bottom-right
	gpu_set_fog(false, outline_color, 0, 0);
		
	if (player_controller == "Gamepad") {
		draw_sprite_ext(sPressX, 0, x + 16, y - 0, .5, .5, 0, c_white, 1);
	} else {
		draw_sprite_ext(sPressF, 0, x + 16, y - 0, .5, .5, 0, c_white, 1);
	}
}

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
//draw_text(x, y, selection_position);


if (state == planter.PICKING) {
	var seed_count = struct_names_count(seeds);
	var seed_names = variable_struct_get_names(seeds);
	array_sort(seed_names, true);
	
	for (var i = 0; i < seed_count; i += 1) {
		//draw_text(x, y + 16, i);
		
		var key = seed_names[i];
		var name = seeds[$ key][$ "name"];
		var price = seeds[$ key][$ "price"];
		var sprite = seeds[$ key][$ "sprite"];
		var grow_duration = seeds[$ key][$ "grow_duration"];
		
		// Outline
		/*
		gpu_set_fog(true, outline_color, 0, 0);
		draw_sprite_ext(sprite, 0, x - outline_thickness, y - outline_thickness, .5, .5, 0, outline_color, .75); // Top-left
		draw_sprite_ext(sprite, 0, x + outline_thickness, y - outline_thickness, .5, .5, 0, outline_color, .75); // Top-right
		draw_sprite_ext(sprite, 0, x - outline_thickness, y + outline_thickness, .5, .5, 0, outline_color, .75); // Bottom-left
		draw_sprite_ext(sprite, 0, x + outline_thickness, y + outline_thickness, .5, .5, 0, outline_color, .75); // Bottom-right
		gpu_set_fog(false, outline_color, 0, 0);*/
		
		draw_sprite_ext(sprite, 0, x, y - 4 - (i * 8), .5, .5, 0, c_white, 1);
		
		if (i == selection_position) {
			
			if (nearest_player.local_data.gold >= price) {
				outline_color = c_lime;
				
				// Draw Selector
				gpu_set_fog(true, outline_color, 0, 0);
				draw_sprite_ext(sprite, 0, x - outline_thickness, (y - 4 - (i * 8)) - outline_thickness, .5, .5, 0, outline_color, .75); // Top-left
				draw_sprite_ext(sprite, 0, x + outline_thickness, (y - 4 - (i * 8)) - outline_thickness, .5, .5, 0, outline_color, .75); // Top-right
				draw_sprite_ext(sprite, 0, x - outline_thickness, (y - 4 - (i * 8)) + outline_thickness, .5, .5, 0, outline_color, .75); // Bottom-left
				draw_sprite_ext(sprite, 0, x + outline_thickness, (y - 4 - (i * 8)) + outline_thickness, .5, .5, 0, outline_color, .75); // Bottom-right
				gpu_set_fog(false, outline_color, 0, 0);
		
				draw_sprite_ext(sprite, 0, x, y - 4 - (i * 8), .5, .5, 0, c_white, 1);
				draw_text_transformed(x - 4, y - 4 - (i * 8), string(price), .25, .25, 0);
		
				if (mouse_check_button_pressed(mb_left)) or (gamepad_button_check(player_device, gp_face1)) {
					plant_seeds(key);
					nearest_player.local_data.gold -= price;
					nearest_player.state = targetting.NULL;
					state = planter.GROWING;
				}
			} else {
				outline_color = c_red;
				
				// Draw Selector
				gpu_set_fog(true, outline_color, 0, 0);
				draw_sprite_ext(sprite, 0, x - outline_thickness, (y - 4 - (i * 8)) - outline_thickness, .5, .5, 0, outline_color, .75); // Top-left
				draw_sprite_ext(sprite, 0, x + outline_thickness, (y - 4 - (i * 8)) - outline_thickness, .5, .5, 0, outline_color, .75); // Top-right
				draw_sprite_ext(sprite, 0, x - outline_thickness, (y - 4 - (i * 8)) + outline_thickness, .5, .5, 0, outline_color, .75); // Bottom-left
				draw_sprite_ext(sprite, 0, x + outline_thickness, (y - 4 - (i * 8)) + outline_thickness, .5, .5, 0, outline_color, .75); // Bottom-right
				gpu_set_fog(false, outline_color, 0, 0);
		
				draw_sprite_ext(sprite, 0, x, y - 4 - (i * 8), .5, .5, 0, c_white, 1);
			}
		}
	}
}