function gamepad_controls(player_instance, player_order, player_device, player_adrenaline) {
	// Inventory Toggle
	//fif (player_instance.state != targetting.GUI) {
		if (gamepad_button_check(player_device, gp_select)) and (!isStructEmpty(player_instance.items)) {
			player_instance.inventory_toggled = true;
		} else {
			player_instance.inventory_toggled = false;
		}
	//}
		
	if (!player_instance.dead) and (player_instance.state != targetting.GUI) and (player_instance.move_state != move.ATTACKING) {
		var moving = false;
			
		gamepad_set_axis_deadzone(player_device, 0.1);
		var abs_haxis = abs(gamepad_axis_value(player_device, gp_axislh));
		var abs_vaxis = abs(gamepad_axis_value(player_device, gp_axislv));
		
		if (abs_haxis > abs_vaxis) {
			if (gamepad_axis_value(player_device, gp_axislh) < 0) and (!place_meeting(player_instance.x - 2, player_instance.y, oCollision)) {
				player_instance.sprite_index = asset_get_index("sPlayerLeft" + string(player_order));
				player_instance.last_direction = "Left";
			}

			if (gamepad_axis_value(player_device, gp_axislh) > 0) and (!place_meeting(player_instance.x + 2, player_instance.y, oCollision)) {
				player_instance.sprite_index = asset_get_index("sPlayerRight" + string(player_order));
				player_instance.last_direction = "Right";
			}
		} else if (abs_vaxis >= abs_haxis) {
			if (gamepad_axis_value(player_device, gp_axislv) > 0) and (!place_meeting(player_instance.x, player_instance.y + 2, oCollision)) {
				player_instance.sprite_index = asset_get_index("sPlayerDown" + string(player_order));
				player_instance.last_direction = "Down";
			}

			if (gamepad_axis_value(player_device, gp_axislv) < 0) and (!place_meeting(player_instance.x, player_instance.y - 2, oCollision)) {
				player_instance.sprite_index = asset_get_index("sPlayerUp" + string(player_order));
				player_instance.last_direction = "Up";
			}
		}

		if (gamepad_axis_value(player_device, gp_axislh) < 0) and (!place_meeting(player_instance.x - 2, player_instance.y, oCollision)) {
			player_instance.move_state = move.RUNNING;
			player_instance.x -= player_adrenaline;
			player_instance.image_speed = .5;
			moving = true;
		}

		if (gamepad_axis_value(player_device, gp_axislh) > 0) and (!place_meeting(player_instance.x + 2, player_instance.y, oCollision)) {
			player_instance.move_state = move.RUNNING;
			player_instance.x += player_adrenaline;
			player_instance.image_speed = .5;
			moving = true;
		}
		if (gamepad_axis_value(player_device, gp_axislv) > 0) and (!place_meeting(player_instance.x, player_instance.y + 2, oCollision)) {
			player_instance.move_state = move.RUNNING;
			player_instance.y += player_adrenaline;
			player_instance.image_speed = .5;
			moving = true;
		}

		if (gamepad_axis_value(player_device, gp_axislv) < 0) and (!place_meeting(player_instance.x, player_instance.y - 2, oCollision)) {
			player_instance.move_state = move.RUNNING;
			player_instance.y -= player_adrenaline;
			player_instance.image_speed = .5;
			moving = true;
		}
				
		if (gamepad_button_check_pressed(player_device, gp_shoulderrb)) and (player_instance.attacking != true) and (!isStructEmpty(player_instance.weapon)) {
			var haxis = gamepad_axis_value(player_device, gp_axisrh);
			var vaxis = gamepad_axis_value(player_device, gp_axisrv);
			
			player_instance.move_state = move.ATTACKING;
			player_instance.attacking = true;
			player_instance.alarm[0] = player_instance.weapon[$ "cooldown"];
					
			if (player_instance.weapon[$ "slug"] == "bow") { // For "Bow" Type Weapons
				var attack = instance_create_layer(player_instance.x, player_instance.y, "Instances", oProjectile);
				with (attack) {
					owner = player_instance;
					device = "Gamepad";
					device_input = player_device;
					dir_x = haxis;
					dir_y = vaxis;
					sprite_index = player_instance.weapon[$ "atk_anim"];
					image_speed = .85;
					
					var arrow = instance_create_layer(player_instance.x + 8, player_instance.y + 8, "Instances", oArrow);
					with (arrow) {
						device = "Gamepad";
						owner = player_instance;
						dir_x = haxis;
						dir_y = vaxis;
					}
				}
			} else { // For "Sword" Type Weapons
				player_instance.sprite_index = asset_get_index("sPlayerAttack" + string(player_instance.last_direction) + string(player_order) + "_" + string(player_instance.weapon[$ "style"]));
				player_instance.image_speed = .75;
				
				var attack = instance_create_layer(player_instance.x, player_instance.y, "Instances", oSwordSwing);
				with (attack) {
					device = "Gamepad";
					owner = player_instance; // Set the owner of the sword swing to this instance
					owner_order = player_order;
					attack_direction = player_instance.last_direction;
					dir_x = haxis;
					dir_y = vaxis;
					sprite_index = player_instance.weapon[$ "atk_anim"];
					image_speed = .75;
				}
			}
		}
			
		if (moving == false) and (player_instance.move_state == move.RUNNING) {
			player_instance.move_state = move.IDLE;
		}
		
		if (player_instance.move_state == move.IDLE) {
			player_idling(player_instance, player_order)
		}
	}
}