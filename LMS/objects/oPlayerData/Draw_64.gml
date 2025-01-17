var _scale = 4;
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var xposition = 8;
var yposition = 8;

// Get input for a specific player
//var _input = rollback_get_input();


if global.state == "GUI" {
	// Inventory
	draw_sprite_ext(sUserInventory, 0, view_wport[0] - 144, view_hport[0] - 72, _scale, _scale, 0, c_white, 1);
	
	
	if point_in_rectangle(mx, my, view_wport[0] - 144, view_hport[0] - 72, view_wport[0] - (144 - 64), view_hport[0] - (72 - 64)) && (_input.interact) {
		if inventoryToggled == false {
			inventoryToggled = true;
		}  else {
			inventoryToggled = false;
		}
	}
	
	/*
	if inventoryToggled == true {
		draw_sprite_ext(sInventoryBackdrop, 0, 0, view_hport[0] - (96 * _scale), _scale, _scale, 0, c_white, 1);
	
		var _eachItem = variable_struct_names_count(global.Items);
		var _itemNames = variable_struct_get_names(global.Items);

		for (var i = 0; i < _eachItem; i++) {
			var key = _itemNames[i];
			var value = global.Items[$ key];
		
			if variable_struct_exists(global.Items, _itemNames[i]) {
				var key = _itemNames[i];
				var value = global.Items[$ key];
		
				if value[$ "amount"] >= 1 {
					var amount = value[$ "amount"];
					var name = value[$ "name"];
					var sprite = value[$ "sprite"];
					var object = value[$ "object"];
					var type = value[$ "type"];
		
					// Draw Items
					var item_x = xposition + (i * (64 + 12)); // 
					var item_y = view_hport[0] - (94 * _scale);
		
					if i >= 4 && i < 8 {
						item_x = xposition + ((i - 4) * (64 + 12));
						item_y = view_hport[0] - (75 * _scale);
					}
			
					if i >= 8 && i < 12 {
						//item_x = xposition + (i - (4 * 2) * (64 + 12));
						item_x = xposition + ((i - 8) * (64 + 12));
						item_y = view_hport[0] - (56 * _scale);
					}
				
					if i >= 12 && i < 16 {
						//item_x = xposition + (i - (4 * 2) * (64 + 12));
						item_x = xposition + ((i - 12) * (64 + 12));
						item_y = view_hport[0] - (37 * _scale);
					}
		
					draw_sprite_ext(sprite, 0, item_x, item_y, _scale, _scale, 0, c_white, 1);
					draw_text(item_x, item_y - 4, amount);
				}
			}
		}
	}
	//draw_text_transformed(xposition + 72, yposition - 6, global.ItemTesting, 2, 2, 0);
	
	
	// Character
	draw_sprite_ext(sPlayerIcon, 0, xposition, yposition, _scale, _scale, 0, c_white, 1);
	draw_set_colour(c_white);
	draw_text_transformed(xposition + 72, yposition, global.userStats.username, 1, 1, 0);
	draw_text_transformed(xposition + 72, yposition + 18, "Lvl. " + string(global.userStats.level), 1, 1, 0);
	draw_text_transformed(xposition + 32, yposition + 65, string(global.userStats.gold), 1, 1, 0);
	draw_text_transformed(xposition + 172, yposition + 65, string(global.userStats.hp), 1, 1, 0);
	if (global.userStats.weapon != noone) {
		draw_sprite_ext(global.userStats.weapon[$ "sprite"], 0, xposition + 120, yposition, _scale, _scale, 0, c_white, 1);
	}

	// Levels
	draw_sprite_ext(sUserLevels, 0, view_wport[0] - 72, view_hport[0] - 72, _scale, _scale, 0, c_white, 1);
	
		if point_in_rectangle(mx, my, view_wport[0] - 72, view_hport[0] - 72, view_wport[0] - (72 - 64), view_hport[0] - (72 - 64)) && (_input.interact) {
		if levelsToggled == false {
			levelsToggled = true;
		}  else {
			levelsToggled = false;
		}
	}
	
	if levelsToggled == true {
	
	//if point_in_rectangle(mx, my, view_wport[0] - 72, view_hport[0] - 72, view_wport[0] - 8, view_hport[0] - 8) && mouse_check_button(mb_left) {
		draw_set_colour(#363636);
		
		var xx = view_wport[0] - 72;
		var yy = yposition;
		var _scale = 2;
		
		// Forestry
		draw_sprite_ext(sForestry, 0, xx, yy + (72 * 7), 4, 4, 0, c_white, 1);
		draw_text_transformed(xx + 8, yy + (72 * 7), global.userLevels.forestry, 1, 1, 0);
		draw_set_colour(c_white);
		draw_text_transformed(xx + 8, yy + (40 + (72 * 7)), string(forestryXpGoal - global.userLevels.forestry_xp), 0.75, 0.75, 0);
		draw_set_colour(c_black);
		*/
		// Strength
		/*
		draw_sprite_ext(sStrength, 0, xx, yy, 4, 4, 0, c_white, 1);
		draw_text_transformed(xx + 8, yy, global.userLevels.strength, 1, 1, 0);
		draw_set_colour(c_white);
		draw_text_transformed(xx + 8, yy + 40, string(strengthXpGoal - global.userLevels.strength_xp), 0.75, 0.75, 0);
		draw_set_colour(#363636);
		
		// Defense
		draw_sprite_ext(sDefense, 0, xx, yy + 72, 4, 4, 0, c_white, 1);
		draw_text_transformed(xx + 8, yy + 72, global.userLevels.defense, 1, 1, 0);
		draw_set_colour(c_white);
		draw_text_transformed(xx + 8, yy + (40 + 72), string(defenseXpGoal - global.userLevels.defense_xp), 0.75, 0.75, 0);
		draw_set_colour(#363636);
		
		// Range
		draw_sprite_ext(sRange, 0, xx, yy + (72 * 2), 4, 4, 0, c_white, 1);
		draw_text_transformed(xx + 8, yy + (72 * 2), global.userLevels.range, 1, 1, 0);
		draw_set_colour(c_white);
		draw_text_transformed(xx + 8, yy + (40 + (72 * 2)), string(rangeXpGoal - global.userLevels.range_xp), 0.75, 0.75, 0);
		draw_set_colour(#363636);
		
		// Magic 
		draw_sprite_ext(sMagic, 0, xx, yy + (72 * 3), 4, 4, 0, c_white, 1);
		draw_text_transformed(xx + 8, yy + (72 * 3), global.userLevels.magic, 1, 1, 0);
		draw_set_colour(c_white);
		draw_text_transformed(xx + 8, yy + (40 + (72 * 3)), string(magicXpGoal - global.userLevels.magic_xp), 0.75, 0.75, 0);
		draw_set_colour(#363636);
		
		// Farming
		draw_sprite_ext(sFarming, 0, xx, yy + (72 * 4), 4, 4, 0, c_white, 1);
		draw_text_transformed(xx + 8, yy + (72 * 4), global.userLevels.farming, 1, 1, 0);
		draw_set_colour(c_white);
		draw_text_transformed(xx + 8, yy + (40 + (72 * 4)), string(farmingXpGoal - global.userLevels.farming_xp), 0.75, 0.75, 0);
		draw_set_colour(#363636);
		
		// Mining
		draw_sprite_ext(sMining, 0, xx, yy + (72 * 5), 4, 4, 0, c_white, 1);
		draw_text_transformed(xx + 8, yy + (72 * 5), global.userLevels.mining, 1, 1, 0);
		draw_set_colour(c_white);
		draw_text_transformed(xx + 8, yy + (40 + (72 * 5)), string(miningXpGoal - global.userLevels.mining_xp), 0.75, 0.75, 0);
		draw_set_colour(#363636);
		
		// Smithing
		draw_sprite_ext(sSmithing, 0, xx, yy + (72 * 6), 4, 4, 0, c_white, 1);
		draw_text_transformed(xx + 8, yy + (72 * 6), global.userLevels.smithing, 1, 1, 0);
		draw_set_colour(c_white);
		draw_text_transformed(xx + 8, yy + (40 + (72 * 6)), string(smithingXpGoal - global.userLevels.smithing_xp), 0.75, 0.75, 0);
		draw_set_colour(#363636);
		*/
		
		draw_set_colour(c_white);
	//}
}
