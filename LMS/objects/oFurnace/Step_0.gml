depth = -y;

var nearest_player = instance_nearest(x, y, obj_player);
var distanceFromPlayer = point_distance(nearest_player.x, nearest_player.y, x, y);
var player_device = nearest_player.local_data[$ "input_device"];
var player_rd = nearest_player.local_data[$ "player_order"];

if (state == furnace.EMPTY) {
	image_index = 0;
	
	// Player Initial Interaction
	if (distanceFromPlayer <= 16) {
		player_order = player_rd;
		if (keyboard_check_pressed(ord("F"))) or (gamepad_button_check_pressed(player_device, gp_face3))  {
			player = nearest_player;
			global.selected_furnace = id;
			state = furnace.PICKING;
			nearest_player.state = targetting.GUI;
		}
	}
}

if (state == furnace.PICKING) {
	// Scrolling Up
	if (mouse_wheel_up()) or (gamepad_button_check_pressed(player_device, gp_padu)) {
		selection_position += 1;
	}
	
	if (selection_position > (struct_names_count(bars) - 1)) and (mouse_wheel_up() or gamepad_button_check_pressed(player_device, gp_padu)) {
		selection_position = 0;
	}
	
	// Scrolling Down
	if (mouse_wheel_down()) or (gamepad_button_check_pressed(player_device, gp_padd)) {
		selection_position -= 1;
	}
	
	if (selection_position == -1) and (mouse_wheel_down() or gamepad_button_check_pressed(player_device, gp_padd)) {
		selection_position = struct_names_count(bars) - 1
	}
}

if (state == furnace.PICKING) and (mouse_check_button_pressed(mb_right) or (gamepad_button_check(player_device, gp_face2))) {
	state = furnace.EMPTY;
	nearest_player.state = targetting.NULL;
	
	/*
	var mx_gui = device_mouse_x_to_gui(0);
	var my_gui = device_mouse_y_to_gui(0);
	
	var _scale = 4;
	var xposition = 8;
	var yposition = 8;
	
	var seed_count = struct_names_count(seeds);
	var seed_names = variable_struct_get_names(seeds);
	array_sort(seed_names, true);
	 
	var pos1_x = view_wport[0] - (display_get_gui_width() / 2) - 72 + 8;
	var pos1_y = view_hport[0] - (display_get_gui_height() / 2) - 112 + 4;
	
	for (var i = 0; i < seed_count; i += 1) {
		var key = seed_names[i];
			
		var name = seeds[$ key][$ "name"];
		var price = seeds[$ key][$ "price"];
		var sprite = seeds[$ key][$ "sprite"];
		var grow_duration = seeds[$ key][$ "grow_duration"];
		
		var _tile_width = 18 * _scale;
		var _spacing = 1 * _scale;
		var _incriment = (_tile_width + _spacing);
		
		// Draw Seeds
		if (i >= 0 && i <= 3) { // First Row
			var firstRowX = pos1_x + (i * (_incriment));
			var firstRowY = pos1_y;
			
			if point_in_rectangle(mx_gui, my_gui, firstRowX, firstRowY, firstRowX + (16 * _scale), firstRowY + (16 * _scale)) {
				if (global.player_data[$ player][$ "gold"] >= price) {
					
					if (mouse_check_button_pressed(mb_left)) {
						global.player_data[$ player][$ "gold"] -= price;
							
						show_debug_message(name);
						
						plant_seeds(key);
						state = status.GROWING;
					}
				}
			}
		} else if (i >= 4 && i <= 7) { // Second Row
			var secondRowX = pos1_x + ((i - 4) * (_incriment));
			var secondRowY = pos1_y + (_tile_width + _spacing);
			
			if point_in_rectangle(mx_gui, my_gui, secondRowX, secondRowY, secondRowX + (16 * _scale), secondRowY + (16 * _scale)) {
				if (global.player_data[$ player][$ "gold"] >= price) {
					
					if (mouse_check_button_pressed(mb_left)) {
						global.player_data[$ player][$ "gold"] -= price;
							
						show_debug_message(name);
						
						plant_seeds(key);
						state = status.GROWING;
					}
				}
			}
		} else if (i >= 8 && i <= 11) { // Third Row
			var thirdRowX = pos1_x + ((i - 8) * (_incriment));
			var thirdRowY = pos1_y + ((_tile_width + _spacing) * 2);
			
			if point_in_rectangle(mx_gui, my_gui, thirdRowX, thirdRowY, thirdRowX + (16 * _scale), thirdRowY + (16 * _scale)) {
				if (global.player_data[$ player][$ "gold"] >= price) {
					
					if (mouse_check_button_pressed(mb_left)) {
						global.player_data[$ player][$ "gold"] -= price;
							
						show_debug_message(name);
						
						plant_seeds(key);
						state = status.GROWING;
					}
				}
			}
		}
	}
	
	// Exit Planter
	if point_in_rectangle(mx_gui, my_gui, view_wport[0] - 72, view_hport[0] - 72, view_wport[0] - (72 - 64), view_hport[0] - (72 - 64)) {
		if (mouse_check_button_pressed(mb_left)) {
			state = status.EMPTY;
		}
	}
	*/
}

if (state == furnace.PENDING) {
	image_index = 2;
	
	if (distanceFromPlayer <= 16) {
		if (keyboard_check_pressed(ord("F"))) or (gamepad_button_check_pressed(player_device, gp_face3))  {
			add_item(player, bars[$ selected_bar][$ "slug"], bars[$ selected_bar], 1);
			selected_bar = "";
			state = furnace.EMPTY;
		}
	}
}