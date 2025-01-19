function game_paused() {
	var numPads = gamepad_get_device_count();
	
	if (stage != stages.PENDING) {
		for (var i = 0; i < numPads; i++) {
		    if (gamepad_is_connected(i)) {
				if (gamepad_button_check_pressed(i, gp_start)) {
					if (global.game_state == "Paused") {
						global.game_state = "Active";
					} else {
						global.game_state = "Paused";
					}
				}
			}
		}
	}
}

function game_paused_gui() {
	draw_set_alpha(.75);
	draw_rectangle_color(0, 0, view_wport[0], view_hport[0], c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_text_transformed(view_wport[0] / 2, view_hport[0] / 2, "Game Paused", 2, 2, 0);
	
	var scale = 8;
	var count = variable_struct_names_count(global.player_data);
	var input_device;
		
	for (var i = 0; i < count; i++) {
		input_device = global.player_data[$ i][$ "input_device"];
		
		// Down
		if (gamepad_button_check_pressed(input_device, gp_padd)) {
			pause_button = "Exit";
		}
		
		// Up
		if (gamepad_button_check_pressed(input_device, gp_padu)) {
			pause_button = "Play";
		}
		
		if (gamepad_button_check_pressed(input_device, gp_face1)) {
			if (pause_button = "Play") {
				global.game_state = "Active";
			} else if (pause_button = "Exit") {
				game_end();	
			}
		}
	}
	
	if (pause_button == "Play") {
		draw_sprite_ext(sGeneralButton, 1, view_wport[0] / 2, view_hport[0] / 2 + 96, scale, scale, 0, c_white, 1);
		draw_text_transformed(view_wport[0] / 2, view_hport[0] / 2 + 130, "Play", 2, 2, 0);
		draw_sprite_ext(sGeneralButton, 0, view_wport[0] / 2, view_hport[0] / 2 + 240, scale, scale, 0, c_white, 1);
		draw_text_transformed(view_wport[0] / 2, view_hport[0] / 2 + 256, "Exit", 2, 2, 0);
	} else if (pause_button == "Exit") {
		draw_sprite_ext(sGeneralButton, 0, view_wport[0] / 2, view_hport[0] / 2 + 96, scale, scale, 0, c_white, 1);
		draw_text_transformed(view_wport[0] / 2, view_hport[0] / 2 + 114, "Play", 2, 2, 0);
		draw_sprite_ext(sGeneralButton, 1, view_wport[0] / 2, view_hport[0] / 2 + 240, scale, scale, 0, c_white, 1);
		draw_text_transformed(view_wport[0] / 2, view_hport[0] / 2 + 272, "Exit", 2, 2, 0);
	}
	

	//draw_text(view_wport[0] / 2, view_hport[0] / 2 + 218, pause_button);
	
	with (all) {
		for (var i = 0; i < 11; i++) {
			if (alarm[i] > -1) alarm[i] += 1.0;
		}
	}
}