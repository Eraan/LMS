var scale = 8;
var numPads = gamepad_get_device_count();
var center_x = display_get_gui_width() / 2;
var center_y = display_get_gui_height() / 2;

for (var i = 0; i < numPads; i++) {
	if (gamepad_is_connected(i)) {
			
		if (state == tab.MAIN) {
			//draw_sprite_ext(Sprite230, 0, 0, 0, .90, .90, 0, c_white, 1);
			
			draw_set_halign(fa_center);
			draw_text_transformed(center_x, center_y - 256, "Incipien", 4, 4, 0);
			
			// Down
			if (gamepad_button_check_pressed(i, gp_padd)) {
				if (selection_position != -1) and (selection_position != 2) {
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
					button_select = "play";
				break;
				case 1:
					button_select = "achievements";
				break;
				case 2:
					button_select = "quit";
				break;
			}
			
			
			
			if (button_select == "play") {
				if (gamepad_button_check_pressed(i, gp_face1)) {
					room_goto(rLobby);
				}
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2, "+ play +", 2, 2, 0);
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 + 64, "achievements", 2, 2, 0);
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 + 128, "quit", 2, 2, 0);
			} else if (button_select == "achievements") {
				if (gamepad_button_check_pressed(i, gp_face1)) {
					state = tab.ACHIEVEMENTS;
				}
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2, "play", 2, 2, 0);
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 + 64, "+ achievements +", 2, 2, 0);
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 + 128, "quit", 2, 2, 0);
			} else if (button_select == "quit") {
				if (gamepad_button_check_pressed(i, gp_face1)) {
					game_end();
				}
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2, "play", 2, 2, 0);
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 + 64, "achievements", 2, 2, 0);
				draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 + 128, "+ quit +", 2, 2, 0);
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



draw_text_transformed(16, display_get_gui_height() - 16, "Music by @JDSherbert", 4, 4, 0);