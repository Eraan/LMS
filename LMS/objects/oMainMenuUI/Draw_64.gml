
var scale = 8;
var numPads = gamepad_get_device_count();

for (var i = 0; i < numPads; i++) {
	if (gamepad_is_connected(i)) {
			
		if (state == tab.MAIN) {
			// Down
			if (gamepad_button_check_pressed(i, gp_padd)) {
				if (selection_position != -1) and (selection_position != 1) {
					selection_position += 1;
				}
				
			}
		
			// Up
			if (gamepad_button_check_pressed(i, gp_padu)) {
				if (selection_position != 0) {
					selection_position -= 1;
				}
			}
			
			switch (selection_position) {
				case 0:
					button_select = "Play";
				break;
				case 1:
					button_select = "Achievements";
				break;
			}
			
			draw_set_halign(fa_center);
			
			if (button_select == "Play") {
				if (gamepad_button_check_pressed(i, gp_face1)) {
					room_goto(rLobby);
				}
				draw_sprite_ext(sGeneralButton, 1, display_get_gui_width() / 2, display_get_gui_height() / 2 + 96, scale, scale, 0, c_white, 1);
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 + 130, "Play", 2, 2, 0);
				draw_sprite_ext(sGeneralButton, 0, display_get_gui_width() / 2, display_get_gui_height() / 2 + 240, scale, scale, 0, c_white, 1);
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 + 256, "Achievements", 2, 2, 0);
			} else if (button_select == "Achievements") {
				if (gamepad_button_check_pressed(i, gp_face1)) {
					state = tab.ACHIEVEMENTS;
				}
				draw_sprite_ext(sGeneralButton, 0, display_get_gui_width() / 2, display_get_gui_height() / 2 + 96, scale, scale, 0, c_white, 1);
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 + 114, "Play", 2, 2, 0);
				draw_sprite_ext(sGeneralButton, 1, display_get_gui_width() / 2, display_get_gui_height() / 2 + 240, scale, scale, 0, c_white, 1);
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 + 272, "Achievements", 2, 2, 0);
			}
			
			draw_set_halign(fa_left);
		}
		
		if (state == tab.ACHIEVEMENTS) {
			if (gamepad_button_check_pressed(i, gp_face2)) {
				state = tab.MAIN;
			}
				
			scale = 4;
			var achievements = variable_struct_names_count(global.achievements);
			var achievement_names = variable_struct_get_names(global.achievements);

			for (var j = 0; j < achievements; j++) {
				var key = achievement_names[j];
				var achievement = global.achievements[$ key][$ "title"];
				var description = global.achievements[$ key][$ "desc"];
				var unlocked = global.achievements[$ key][$ "unlocked"];
				var sprite = global.achievements[$ key][$ "sprite"];
				var reward = global.achievements[$ key][$ "reward"];
		
				//if (unlocked) {
					draw_sprite_ext(sprite, unlocked, 16, 16 + (j * (16 * scale + 8)), scale, scale, 0, c_white, 1);
				//}
				draw_text_color(96, 16 + (j * (16 * scale + 8)), achievement, c_white, c_white, c_white, c_white, 1);
				draw_text_color(96, 32 + (j * (16 * scale + 8)), description, c_white, c_white, c_white, c_white, .8);
				draw_text_color(96, 48 + (j * (16 * scale + 8)), reward, c_orange, c_orange, c_orange, c_orange, 1);
			}
		}
		
	}
}



