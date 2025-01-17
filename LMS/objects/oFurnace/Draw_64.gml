/*
var _scale = 4;
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var xposition = 8;
var yposition = 8;

if (state == status.PICKING) {
	// Draw Seed Options UI
	if (oGUI.state == screen.SPLIT) {
		draw_set_alpha(.75);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		draw_sprite_ext(sGenericUI, 0, view_xport[player_order] / 2, view_yport[player_order] + view_hport[player_order] / 2, _scale, _scale, 0, c_white, 1); //draw_sprite_ext(sGenericUI, 0, view_wport[0] - (display_get_gui_width() / 2), view_hport[0] - (display_get_gui_height() / 2), _scale, _scale, 0, c_white, 1);
		show_debug_message(view_yport[player_order] + view_hport[player_order] / 2);
		var seed_count = struct_names_count(seeds);
		var seed_names = variable_struct_get_names(seeds);
		array_sort(seed_names, true);
	
		var pos1_x = view_xport[player_order]; //var pos1_x = view_wport[player_order] - (display_get_gui_width() / 2) - 72 + 8;
		var pos1_y = view_yport[player_order]; //var pos1_y = view_hport[player_order] - (display_get_gui_height() / 2) - 112 + 4;
	
		for (var i = 0; i < seed_count; i += 1) {
			var key = seed_names[i];
		
			show_debug_message(seeds);		
			var name = seeds[$ key][$ "name"];
			var price = seeds[$ key][$ "price"];
			var sprite = seeds[$ key][$ "sprite"];
			var grow_duration = seeds[$ key][$ "grow_duration"];
		
			// Draw Seed Info + Price
		
			draw_text(pos1_x, pos1_y, "yoyo");
			//draw_text_ext_transformed_color(pos1_x - 64, pos1_y, name, 1, 500, _scale, _scale, 0, c_white, c_white, c_white, c_white, 0);
		
			var _tile_width = 18 * _scale;
			var _spacing = 1 * _scale;
			var _incriment = (_tile_width + _spacing);
		
			// Draw Seeds
			if (i >= 0 && i <= 3) { // First Row
				var firstRowX = pos1_x + (i * (_incriment));
				var firstRowY = pos1_y;
		
			
				draw_sprite_ext(asset_get_index(sprite), 0, firstRowX, firstRowY, _scale, _scale, 0, c_white, 1);
			
				if point_in_rectangle(mx, my, firstRowX, firstRowY, firstRowX + (16 * _scale), firstRowY + (16 * _scale)) {
					if (global.player_data[$ player][$ "gold"] >= price) {
						draw_sprite_ext(sHoverItemAvailable, 0, firstRowX, firstRowY, _scale, _scale, 0, c_white, 1);
					
					} else {
						draw_sprite_ext(sHoverItemUnavailable, 0, firstRowX, firstRowY, _scale, _scale, 0, c_white, 1);
					}
				}
			} else if (i >= 4 && i <= 7) { // Second Row
				var secondRowX = pos1_x + ((i - 4) * (_incriment));
				var secondRowY = pos1_y + (_tile_width + _spacing);
		
				draw_sprite_ext(sprite, 0, secondRowX, secondRowY, _scale, _scale, 0, c_white, 1);
			
				if point_in_rectangle(mx, my, secondRowX, secondRowY, secondRowX + (16 * _scale), secondRowY + (16 * _scale)) {
					if (global.player_data[$ player][$ "gold"] >= price) {
						draw_sprite_ext(sHoverItemAvailable, 0, secondRowX, secondRowY, _scale, _scale, 0, c_white, 1);
					
					} else {
						draw_sprite_ext(sHoverItemUnavailable, 0, secondRowX, secondRowY, _scale, _scale, 0, c_white, 1);
					}
				}
			} else if (i >= 8 && i <= 11) { // Third Row
				var thirdRowX = pos1_x + ((i - 8) * (_incriment));
				var thirdRowY = pos1_y + ((_tile_width + _spacing) * 2);
			
				draw_sprite_ext(sprite, 0, thirdRowX, thirdRowY, _scale, _scale, 0, c_white, 1);
			
				if point_in_rectangle(mx, my, thirdRowX, thirdRowY, thirdRowX + (16 * _scale), thirdRowY + (16 * _scale)) {
					if (global.player_data[$ player][$ "gold"] >= price) {
						draw_sprite_ext(sHoverItemAvailable, 0, thirdRowX, thirdRowY, _scale, _scale, 0, c_white, 1);
					
					} else {
						draw_sprite_ext(sHoverItemUnavailable, 0, thirdRowX, thirdRowY, _scale, _scale, 0, c_white, 1);
					}
				}
			}
		}
	}
	
	// Exit Planter UI Button
	draw_sprite_ext(sButtonBack, 0, view_wport[0] - 72, view_hport[0] - 72, 1, 1, 0, c_white, 1);
}
*/