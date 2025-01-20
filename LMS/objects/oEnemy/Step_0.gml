depth = -y;

if (oSaveLoad.stage != stages.FIGHT) {
	if (enemy_health <= 0) and (state != enemy.DEAD) {
		alarm[1] = 300;	
		image_speed = 0;
		image_index = 1;
		state = enemy.DEAD;
		oSaveLoad.enemy_count -= 1;
		var gold_drop = instance_create_layer(x, y, "Instances", oGold) 
		with (gold_drop) {
			amount = 5;
		}
	}
	
	if (state == enemy.DEAD) and (alarm[1] == -1) {
		instance_destroy();
		oSaveLoad.enemy_count -= 1;
	}

	var nearest_player = instance_nearest(x + 8, y + 8, obj_player);
	var target_x = nearest_player.x + 8; // Replace obj_player with the player's object name
	var target_y = nearest_player.y + 8;
	var dist_to_player = point_distance(x + 8, y + 8, target_x, target_y);

	if (dist_to_player <= 200) {
		player = nearest_player;
	} else {
		player = noone;
		state = enemy.IDLE;
		sprite_index = sFarmer;
	}

	if (player != noone) and (state != enemy.DEAD) {
		var enemy_direction = point_direction(x + 8, y + 8, target_x, target_y);

		// If the player is within attack range
		if (dist_to_player <= attack_range) { // Replace attack_range with your desired range
		    if (can_attack) { // Use a cooldown or a flag for controlled attacks
				state = enemy.ATTACKING;
		        enemy_perform_attack(player); // Call your attack function
		        can_attack = false; // Reset the cooldown or flag
		        alarm[0] = attack_cooldown; // Set cooldown (adjust attack_cooldown value)
		    }
		} else {
		    // Move toward the player while avoiding solid objects
			state = enemy.MOVING;
		    mp_potential_step_object(target_x, target_y, .75, oCollision); // Replace move_speed with enemy speed
		
			if (enemy_direction >= 45) and (enemy_direction < 135) {
				sprite_index = sFarmerUp;
				image_speed = 1;
			}
	
			if ((enemy_direction >= 0) and (enemy_direction < 45)) or ((enemy_direction >= 315) and (enemy_direction <= 360)) {
				sprite_index = sFarmerRight;
				image_speed = 1;
			}
		
			if (enemy_direction >= 135) and (enemy_direction < 270) {
				sprite_index = sFarmerLeft;
				image_speed = 1;
			}
		
			if (enemy_direction >= 270) and (enemy_direction < 315) {
				sprite_index = sFarmerDown;
				image_speed = 1;
			}
		}
	}
}

if (oSaveLoad.stage == stages.FIGHT) {
	instance_destroy();
	oSaveLoad.enemy_count -= 1;
	var gold_drop = instance_create_layer(x, y, "Instances", oGold) 
	with (gold_drop) {
		amount = 5;
	}
}