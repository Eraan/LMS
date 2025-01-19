if keyboard_check_pressed(ord("1")) {save_game();};

if keyboard_check_pressed(ord("4")) {load_game();};

if keyboard_check_pressed(ord("Q")) {
    if window_get_fullscreen() {
        window_set_fullscreen(false);
    } else {
        window_set_fullscreen(true);
    }
}

var count = variable_struct_names_count(global.player_data);
var names = variable_struct_get_names(global.player_data);
var numPads = gamepad_get_device_count();

if (stage == stages.PENDING) and (count < 4) and (room == rLobby) {
	for (var i = 0; i < numPads; i++) {
	    if (gamepad_is_connected(i)) {
			if (!struct_has_value(global.player_data, count, names, "input_device", i)) {
				if (gamepad_button_check_pressed(i, gp_start)) or (gamepad_button_check_pressed(i, gp_face1)) {
					add_player("Gamepad", i);
				}
			}
	    }
	}

	if (keyboard_check_pressed(ord("P"))) {
		add_player("Keyboard", 0);
	}
}

game_paused();

if (keyboard_check_pressed(ord("H"))) {
	oGUI.state = screen.ADAPT;
}

if (stage == stages.PENDING) and (count > 1) and (alarm[0] == "-1") {
	alarm[0] = SECOND10;
}

if (stage == stages.init_PREP) and (count > 1) and (alarm[1] == "-1") {
	
}

// Enemy Spawning after
if (stage == stages.FIGHT) and (count > 1) and (alarm[2] == "-1") {
	
}

if (stage == stages.PREP) and (count > 1) and (alarm[1] == "-1") {
	
}

if (stage == stages.FIGHT) and (count > 1) {
	for (var i = 0; i < count; i++) {
		var player_instance = global.player_data[$ i][$ "player_instance"];
		var player_start_pos = instance_find(oPlayerStart, i);
	}
}

if ((stage == stages.FIGHT) or (stage == stages.SHOWDOWN)) and (death_count == (count - 1)) and (count > 1) {
	death_count = 0;
	stage = stages.PREP;
	oGUI.state = screen.SPLIT;
	alarm[1] = SECOND30;
	alarm[2] = -1;
	alarm[11] = 120;
	global.game_rounds += 1;

	for (var i = 0; i < count; i++) {
		var player_instance = global.player_data[$ i][$ "player_instance"];
		var player_start_pos = instance_find(oPlayerStart, i);
	
		if (player_instance.dead == true) {
			player_instance.x = player_start_pos.x;
			player_instance.y = player_start_pos.y;
			player_instance.local_data.hp = 20;
			player_instance.dead = false;
		
			player_instance.sprite_index = asset_get_index("sPlayer" + string(i));
		} else {
			player_instance.local_data.hp = 20;
			player_instance.local_data.wins += 1;
		}
		
		if (player_instance.local_data.wins == 3) {
			show_debug_message("Game Over");
			game_end();
		}
	}
}