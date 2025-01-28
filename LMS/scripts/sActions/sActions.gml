// Mining
function start_mining(player_direction, chosen_time) {
	audio_play_sound(miningSound, 10, true, 1, 0, 1.5);
	alarm[0] = chosen_time;
	
	if player_direction == 90 {
		with player {
			sprite_index = sPlayerUpMine;
			image_speed = 0.75;
		}
	}
	if player_direction == 270 {
				
		with player {
			sprite_index = sPlayerDownMine;
			image_speed = 0.75;
		}
	}	
	if player_direction == 180 {
				
		with player {
			sprite_index = sPlayerLeftMine;
			image_speed = 0.75;
		}
	}	
	if player_direction == 0 {
				
		with player {
			sprite_index = sPlayerRightMine;
			image_speed = 0.75;
		}
	}
}
	
function stop_mining(player_direction, chosen_time) {
	audio_stop_sound(miningSound);
	audio_play_sound(treeFallSound, 10, false, 1, 0.0, 5);
	global.Mining = false;
	image_index = 1;
	alarm[1] = chosen_time
	
	if player_direction == 90 {
		with player {
			sprite_index = sPlayerUp0;
			image_index = 1;
			image_speed = 0;
		}
	}
	if player_direction == 270 {
		with player {
			sprite_index = sPlayerDown0;
			image_index = 1;
			image_speed = 0;
		}
	}
	if player_direction == 180 {
		with player {
			sprite_index = sPlayerLeftTest;
			image_index = 1;
			image_speed = 0;
		}
	}
	if player_direction == 0 {
		with player {
			sprite_index = sPlayerRight0;
			image_index = 1;
			image_speed = 0;
		}
	}
}

// Forestry
function start_chopping(chosen_time) {
	/*
	if (event_data[? "event_type"] == "sprite event") {
	    switch (event_data[? "message"]) {
	        case "Hit":
	            audio_play_sound(woodChopSound, 10, true);
	        break;
	    }
	}*/
	
	//audio_play_sound(woodChopSound, 10, true);
	alarm[0] = chosen_time;
}
	
function stop_chopping(chosen_time) {
	audio_stop_sound(woodChopSound);
	alarm[1] = chosen_time;
}




function plant_seeds(key) {
    // Ensure there's a valid selected instance
    if (global.selected_planter != noone) {
        var selected_instance = global.selected_planter;
        
        // Use the selected instance's position
        with (selected_instance) {
            var new_plant = instance_create_layer(x, y, "Instances", oPlant);
            with (new_plant) {
                seed = string(key);
            }
        }
        
        // Reset state
		image_index = 1;
    } else {
        show_debug_message("No instance selected for planting.");
    }
}

function smelt_ore(key) {
    // Ensure there's a valid selected instance
    if (global.selected_furnace != noone) {
        var selected_instance = global.selected_furnace;
        
        // Use the selected instance's position
        with (selected_instance) {
            var new_plant = instance_create_layer(x, y, "Instances", oPlant);
            with (new_plant) {
                seed = string(key);
            }
        }
        
        // Reset state
		image_index = 1;
    } else {
        show_debug_message("No instance selected for planting.");
    }
}

function enemy_perform_attack(target_player) {
	// Fire an Arrow
    var proj = instance_create_layer(x + 8, y + 8, "Instances", oDart);
	with proj {
		device = "Keyboard";
		owner = other.id;
		dir_x = target_player.x + 8;
		dir_y = target_player.y + 8;
		arrow_dir = point_direction(x + 8, y + 8, target_player.x + 8, target_player.y + 8) - 90;
	}
}