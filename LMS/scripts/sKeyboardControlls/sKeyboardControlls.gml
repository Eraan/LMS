function keyboard_controls(player_instance, player_order, player_device, player_adrenaline) {
	// Inventory Toggle
	if (player_instance.state != targetting.GUI) {
		if (keyboard_check(ord("E"))) and (!isStructEmpty(player_instance.items)) {
			player_instance.inventory_toggled = true;
		} else {
			player_instance.inventory_toggled = false;
		}
	}
		
	if (!player_instance.dead) and (player_instance.state != targetting.GUI) {
		var moving = false;
			
		gamepad_set_axis_deadzone(player_device, 0.1);

		if (keyboard_check(ord("A"))) and (!place_meeting(player_instance.x - 2, player_instance.y, oCollision)) {
			player_instance.move_state = move.RUNNING;
			player_instance.x -= player_adrenaline;
			player_instance.image_speed = .5;
			player_instance.sprite_index = asset_get_index("sPlayerLeft" + string(player_order));
			moving = true;
		}

		if (keyboard_check(ord("D"))) and (!place_meeting(player_instance.x + 2, player_instance.y, oCollision)) {
			player_instance.move_state = move.RUNNING;
			player_instance.x += player_adrenaline;
			player_instance.image_speed = .5;
			player_instance.sprite_index = asset_get_index("sPlayerRight" + string(player_order));
			moving = true;
		}

		if (keyboard_check(ord("S"))) and (!place_meeting(player_instance.x, player_instance.y + 2, oCollision)) {
			player_instance.move_state = move.RUNNING;
			player_instance.y += player_adrenaline;
			player_instance.image_speed = .5;
			player_instance.sprite_index = asset_get_index("sPlayerDown" + string(player_order));
			moving = true;
		}

		if (keyboard_check(ord("W"))) and (!place_meeting(player_instance.x, player_instance.y - 2, oCollision)) {
			player_instance.move_state = move.RUNNING;
			player_instance.y -= player_adrenaline;
			player_instance.image_speed = .5;
			player_instance.sprite_index = asset_get_index("sPlayerUp" + string(player_order));
			moving = true;
		}
				
		if (mouse_check_button_pressed(mb_left)) and (player_instance.attacking != true) and (!isStructEmpty(player_instance.weapon)) {
			var target_x = device_mouse_x(player_device);
			var target_y = device_mouse_y(player_device);
			
			player_instance.attacking = true;
			player_instance.alarm[0] = player_instance.weapon[$ "cooldown"];
					
			if (player_instance.weapon[$ "slug"] == "bow") { // For "Bow" Type Weapons
				var attack = instance_create_layer(player_instance.x, player_instance.y, "Instances", oProjectile);
				with (attack) {
					owner = player_instance;
					device = "Keyboard";
					device_input = player_device;
					dir_x = target_x;
					dir_y = target_y;
					sprite_index = player_instance.weapon[$ "atk_anim"];
					image_speed = .85;
						
					var arrow = instance_create_layer(player_instance.x + 8, player_instance.y + 8, "Instances", oArrow);
					with (arrow) {
						device = "Keyboard";
						owner = player_instance;
						dir_x = target_x;
						dir_y = target_y;
						arrow_dir = point_direction(x + 8, y + 8, target_x, target_y) - 90;
					}
				}
			} else { // For "Sword" Type Weapons
				var attack = instance_create_layer(player_instance.x, player_instance.y, "Instances", oSwordSwing);
				with (attack) {
					device = "Keyboard";
					owner = player_instance; // Set the owner of the sword swing to this instance
					dir_x = target_x;
					dir_y = target_y;
					sprite_index = player_instance.weapon[$ "atk_anim"];
					image_speed = .85;
				}
			}
		}
			
		if (moving == false) {
			player_instance.move_state = move.IDLE;
			player_instance.image_index = 1;
			player_instance.image_speed = 0;
				
		}
	}
}