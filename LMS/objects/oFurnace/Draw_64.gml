var scale = 4;

var outline_color = c_white; // Outline color
var outline_thickness = .5;  // How thick the outline is

var nearest_player = instance_nearest(x, y, obj_player);
var distanceFromPlayer = point_distance(nearest_player.x, nearest_player.y, x, y);
var player_rd = nearest_player.local_data[$ "player_order"];
var player_device = nearest_player.local_data[$ "input_device"];
var player_controller = nearest_player.local_data[$ "controlls"];
var player_gold = nearest_player.local_data.gold;

if (state == furnace.PICKING) {
	selection_position = ui_select_position(player_device, bars, selection_position);
	
	var ui_pos_x = (view_xport[player_rd] / 2 + 8);
	var ui_pos_y = (view_yport[player_rd] / 2 + 8) + 128;
	
	draw_sprite_ext(sGenericUI, 0, ui_pos_x, ui_pos_y, 4, 4, 0, c_white, 1);
	
	var bars_count = struct_names_count(bars);
	var bars_names = variable_struct_get_names(bars);
	
	for (var i = 0; i < bars_count; i += 1) {
		
		var slot_size = 18 * scale; // They are actually 18 x 18
		var spacing = 1 * scale;
		var first_slot_x = ui_pos_x + 48 * scale;
		var first_slot_y = ui_pos_y + 5 * scale;
		
		var key = bars_names[i];
		var name = bars[$ key][$ "name"];
		var price = bars[$ key][$ "price"];
		var sprite = bars[$ key][$ "sprite"];
		var recipe = bars[$ key][$ "recipe"];
		var amount = bars[$ key][$ "amount"];
		var cooldown = bars[$ key][$ "cooldown"];

		// Check that Player fulfills requirements to obtain item.
			var fullfillable = false;
			var materials = struct_names_count(recipe);
			var materials_required = variable_struct_get_names(recipe);
			var player_materials = 0;
			
			draw_set_color(c_black);
			draw_text_transformed(ui_pos_x + 28, ui_pos_y + 64, "Requirements", 1, 1, 0);
			
			for (var j = 0; j < materials; j += 1) {
				var mat = materials_required[j];
				
				if (i == selection_position) {
					draw_text_transformed(ui_pos_x + 28, ui_pos_y + 96 + (16 * j), (string(recipe[$ mat]) + " x " + string(mat)), 1, 1, 0);
				}
				
				if (variable_struct_exists(nearest_player.items, mat)) {
					if (nearest_player.items[$ mat][$ "amount"] >= recipe[$ mat]) {
						player_materials += 1;
					}
				}
			}
			
			if (materials == player_materials) {
				fullfillable = true;
			}
			draw_set_color(c_white);
			
		if (i == selection_position) {
			// Price
			draw_text_transformed(ui_pos_x + 28, ui_pos_y + 16, name, 1, 1, 0);
			draw_sprite_ext(sCoin, 0, ui_pos_x + 20, ui_pos_y + 204, scale, scale, 0, c_white, 1);
			draw_text_transformed(ui_pos_x + 48, ui_pos_y + 204, price, 1, 1, 0);
		}
			
		// Item
		if (i < 4) {
			draw_sprite_ext(sprite, 0, first_slot_x + ((slot_size + spacing) * i), first_slot_y, scale, scale, 0, c_white, 1);
			if (i == selection_position) {
				if (nearest_player.local_data.gold >= price) and (fullfillable) {
					draw_sprite_ext(sHoverItemAvailable, 0, first_slot_x + ((slot_size + spacing) * i), first_slot_y, scale, scale, 0, c_white, 1);
						
					if (gamepad_button_check(player_device, gp_face1)) {
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
					draw_sprite_ext(sHoverItemUnavailable, 0, first_slot_x + ((slot_size + spacing) * i), first_slot_y, scale, scale, 0, c_white, 1);
				}
			}
		}
		
		if (i > 3) and (i < 8) {
			draw_sprite_ext(sprite, 0, first_slot_x + ((slot_size + spacing) * (i - 4)), first_slot_y + (slot_size + spacing), scale, scale, 0, c_white, 1);
			if (i == selection_position) {
				if (nearest_player.local_data.gold >= price) and (fullfillable) {	
					draw_sprite_ext(sHoverItemAvailable, 0, first_slot_x + ((slot_size + spacing) * (i - 4)), first_slot_y + (slot_size + spacing), scale, scale, 0, c_white, 1);
						
					if (gamepad_button_check(player_device, gp_face1)) {
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
					draw_sprite_ext(sHoverItemUnavailable, 0, first_slot_x + ((slot_size + spacing) * (i - 4)), first_slot_y + (slot_size + spacing), scale, scale, 0, c_white, 1);
				}
			}
		}
	}
}