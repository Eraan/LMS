function gamepad_controls(player_instance, player_order, player_device, player_adrenaline) {
	// Inventory Toggle
	//fif (player_instance.state != targetting.GUI) {
		if (gamepad_button_check(player_device, gp_select)) and (!isStructEmpty(player_instance.items)) {
			player_instance.inventory_toggled = true;
		} else {
			player_instance.inventory_toggled = false;
		}
	//}
		
	if (!player_instance.dead) and (player_instance.state != targetting.GUI) {
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
				var attack = instance_create_layer(player_instance.x, player_instance.y, "Instances", oSwordSwing);
				with (attack) {
					device = "Gamepad";
					owner = player_instance; // Set the owner of the sword swing to this instance
					dir_x = haxis;
					dir_y = vaxis;
					sprite_index = player_instance.weapon[$ "atk_anim"];
					image_speed = .85;
				}
			}
		}
			
		if (moving == false) {
			player_instance.move_state = move.IDLE;
			
			if (player_instance.idle_timer == undefined) {
					player_instance.idle_timer = irandom_range(480, 3000);
				}
					
				if (player_instance.idle_timer > 0) {
		            player_instance.idle_timer -= 1;
						
					if (player_instance.sprite_index != (asset_get_index("sPlayerIdle" + string(player_instance.last_direction) + string(player_order) + "_action" + string(player_instance.idle_action)))) {
						player_instance.sprite_index = asset_get_index("sPlayerIdle" + string(player_instance.last_direction) + string(player_order) + "_rest");	
					}
		        } else {
		            // Trigger the action animation
				    //if (player_instance.sprite_index != asset_get_index("sPlayerIdleDown" + string(player_order) + "_action" + string(random_action))) {
				        player_instance.sprite_index = asset_get_index("sPlayerIdle" + string(player_instance.last_direction) + string(player_order) + "_action" + string(player_instance.idle_action));
				        player_instance.image_speed = 0.4;
				    //}

				    // Check if the action animation has finished
				    if (player_instance.image_index >= (sprite_get_number(player_instance.sprite_index) - 1)) {
				        // Reset to resting state
				        player_instance.sprite_index = asset_get_index("sPlayerIdle" + string(player_instance.last_direction) + string(player_order) + "_rest");
				        player_instance.image_speed = 0;

				        // Reset idle timer and random action
				        player_instance.idle_timer = irandom_range(480, 3000);
						player_instance.idle_action = irandom_range(0, 3);
				    }
		        }
			
			/*
			switch (player_instance.last_direction) {
				case "left":
					if (player_instance.idle_timer == undefined) {
						player_instance.idle_timer = irandom_range(480, 3000);
					}
					
					if (player_instance.idle_timer > 0) {
		                player_instance.idle_timer -= 1;
						
						if (player_instance.sprite_index != (asset_get_index("sPlayerIdleLeft" + string(player_order) + "_action" + string(player_instance.idle_action)))) {
							player_instance.sprite_index = asset_get_index("sPlayerIdleLeft" + string(player_order) + "_rest");	
						}
		            } else {
		                // Trigger the action animation
				        //if (player_instance.sprite_index != asset_get_index("sPlayerIdleDown" + string(player_order) + "_action" + string(random_action))) {
				            player_instance.sprite_index = asset_get_index("sPlayerIdleLeft" + string(player_order) + "_action" + string(player_instance.idle_action));
				            player_instance.image_speed = 0.4;
				        //}

				        // Check if the action animation has finished
				        if (player_instance.image_index >= (sprite_get_number(player_instance.sprite_index) - 1)) {
				            // Reset to resting state
				            player_instance.sprite_index = asset_get_index("sPlayerIdleLeft" + string(player_order) + "_rest");
				            player_instance.image_speed = 0;

				            // Reset idle timer and random action
				            player_instance.idle_timer = irandom_range(480, 3000);
							player_instance.idle_action = irandom_range(0, 3);
				        }
		            }
				break;
				case "right":
					if (alarm[2] == -1) {
						alarm[2] = 240;
						player_instance.sprite_index = asset_get_index("sPlayerIdleDown" + string(player_order) + "_action" + string(irandom_range(1,2)));
					} else {
						player_instance.sprite_index = asset_get_index("sPlayerIdleDown" + string(player_order) + "_action0");
					}
				break;
				case "up":
					if (player_instance.idle_timer == undefined) {
						player_instance.idle_timer = irandom_range(480, 3000);
					}
					
					if (player_instance.idle_timer > 0) {
		                player_instance.idle_timer -= 1;
						
						if (player_instance.sprite_index != (asset_get_index("sPlayerIdleUp" + string(player_order) + "_action" + string(player_instance.idle_action)))) {
							player_instance.sprite_index = asset_get_index("sPlayerIdleUp" + string(player_order) + "_rest");	
						}
		            } else {
		                // Trigger the action animation
				        //if (player_instance.sprite_index != asset_get_index("sPlayerIdleDown" + string(player_order) + "_action" + string(random_action))) {
				            player_instance.sprite_index = asset_get_index("sPlayerIdleUp" + string(player_order) + "_action" + string(player_instance.idle_action));
				            player_instance.image_speed = 0.4;
				        //}

				        // Check if the action animation has finished
				        if (player_instance.image_index >= (sprite_get_number(player_instance.sprite_index) - 1)) {
				            // Reset to resting state
				            player_instance.sprite_index = asset_get_index("sPlayerIdleUp" + string(player_order) + "_rest");
				            player_instance.image_speed = 0;

				            // Reset idle timer and random action
				            player_instance.idle_timer = irandom_range(480, 3000);
							player_instance.idle_action = irandom_range(0, 3);
				        }
		            }
				break;
				case "down":
					if (player_instance.idle_timer == undefined) {
						player_instance.idle_timer = irandom_range(480, 3000);
					}
					
					if (player_instance.idle_timer > 0) {
		                player_instance.idle_timer -= 1;
						
						if (player_instance.sprite_index != (asset_get_index("sPlayerIdleDown" + string(player_order) + "_action" + string(player_instance.idle_action)))) {
							player_instance.sprite_index = asset_get_index("sPlayerIdleDown" + string(player_order) + "_rest");	
						}
		            } else {
		                // Trigger the action animation
				        //if (player_instance.sprite_index != asset_get_index("sPlayerIdleDown" + string(player_order) + "_action" + string(random_action))) {
				            player_instance.sprite_index = asset_get_index("sPlayerIdleDown" + string(player_order) + "_action" + string(player_instance.idle_action));
				            player_instance.image_speed = 0.4;
				        //}

				        // Check if the action animation has finished
				        if (player_instance.image_index >= (sprite_get_number(player_instance.sprite_index) - 1)) {
				            // Reset to resting state
				            player_instance.sprite_index = asset_get_index("sPlayerIdleDown" + string(player_order) + "_rest");
				            player_instance.image_speed = 0;

				            // Reset idle timer and random action
				            player_instance.idle_timer = irandom_range(480, 3000);
							player_instance.idle_action = irandom_range(0, 3);
				        }
		            }
				break;
			}*/
		}
	}
}