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
		
if (state == furnace.EMPTY) and (distanceFromPlayer <= 16) {
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


if (state == furnace.PICKING) {
	exit;
	
	var bars_count = struct_names_count(bars);
	var bars_names = variable_struct_get_names(bars);
	//array_sort(bars_names, true);
	
	for (var i = 0; i < bars_count; i += 1) {
		//draw_text(x, y + 16, i);
		
		var key = bars_names[i];
		var name = bars[$ key][$ "name"];
		var price = bars[$ key][$ "price"];
		var sprite = bars[$ key][$ "sprite"];
		var recipe = bars[$ key][$ "recipe"];
		var amount = bars[$ key][$ "amount"];
		var cooldown = bars[$ key][$ "cooldown"];
		
		// Outline
		/*
		gpu_set_fog(true, outline_color, 0, 0);
		draw_sprite_ext(sprite, 0, x - outline_thickness, y - outline_thickness, .5, .5, 0, outline_color, .75); // Top-left
		draw_sprite_ext(sprite, 0, x + outline_thickness, y - outline_thickness, .5, .5, 0, outline_color, .75); // Top-right
		draw_sprite_ext(sprite, 0, x - outline_thickness, y + outline_thickness, .5, .5, 0, outline_color, .75); // Bottom-left
		draw_sprite_ext(sprite, 0, x + outline_thickness, y + outline_thickness, .5, .5, 0, outline_color, .75); // Bottom-right
		gpu_set_fog(false, outline_color, 0, 0);*/
		
		// Item
		draw_sprite_ext(sprite, 0, x, y - 4 - (i * 8), .5, .5, 0, c_white, 1);
		
		
		
		
		if (i == selection_position) {
			var fullfillable = false;
			var materials = struct_names_count(recipe);
			var materials_required = variable_struct_get_names(recipe);
			var player_materials = 0;
			
			// Price
			draw_sprite_ext(sCoin, 0, x + 10, y - 4 - (i * 8), 1, 1, 0, c_white, 1);
			draw_text_transformed(x + 18, y - 4 - (i * 8), price, .25, .25, 0);
			
			
			for (var j = 0; j < materials; j += 1) {
				var mat = materials_required[j];
				
				draw_text_transformed(x + 26, (y - 4 - (i * 8)) + (8 * j), (string(recipe[$ mat]) + " x " + string(mat)), .25, .25, 0);
				
				if (variable_struct_exists(nearest_player.items, mat)) {
					if (nearest_player.items[$ mat][$ "amount"] >= recipe[$ mat]) {
						player_materials += 1;
					}
				}
			}
			
			// Fullfilment Requirements
				if (materials == player_materials) {
					fullfillable = true;
				}
				
			if (nearest_player.local_data.gold >= price) and (fullfillable) {
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
					alarm[0] = cooldown;
					image_index = 1;
				// Save Requested Bar Details
					selected_bar = key;
					selected_bar_sprite = sprite;
				// Deduct Gold from Player
					nearest_player.local_data.gold -= price;
				// Remove Materials from Player's Inventory
					for (var k = 0; k < materials; k += 1) {
						var mat = materials_required[k];
				
						nearest_player.items[$ mat][$ "amount"] -= recipe[$ mat];
					}
					nearest_player.state = targetting.NULL;
					state = furnace.SMELTING;
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

if (state == furnace.PENDING) and (selected_bar_sprite != noone) {
	draw_sprite_ext(selected_bar_sprite, 0, x + 4, y + 8, .5, .5, 0, c_white, 1);
}

if (state == furnace.SMELTING) {
	sprite_index = sFurnaceLit;
	image_speed = .25;
	
	// Increment the smoke timer
	smoke_timer++;

	// Spawn smoke periodically
	if (smoke_timer >= 120) { // Adjust for frequency (lower = more smoke)
	    instance_create_depth(x + 6, y, -100, oSmoke); // Spawn above the furnace
		//instance_create_layer(x + 6, y, "GUI", oSmoke); // Spawn above the furnace
	    smoke_timer = 0; // Reset timer
	}
} else {
	sprite_index = sFurnace;
	image_speed = 0;
}