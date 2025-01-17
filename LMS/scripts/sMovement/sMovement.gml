function player_movement(mx, my) {
	var player_count = variable_struct_names_count(global.player_data);

	for (var i = 0; i < player_count; i++) {
		var controlls = global.player_data[$ i][$ "controlls"];
		var device = global.player_data[$ i][$ "input_device"];
		var player_instance = global.player_data[$ i][$ "player_instance"];
		var player_ordr = global.player_data[$ i][$ "player_order"];
		
		if (global.player_data[$ i][$ "hp"] <= 0) and (player_instance.dead == false) {
			player_instance.sprite_index = asset_get_index("sPlayerDead" + string(player_ordr));
			//alarm[1] = 300;
			player_instance.dead = true;
			oSaveLoad.death_count += 1;
			global.player_data[$ i][$ "deaths"] += 1;
		}
		
		// Inventory Toggle
		if (player_instance.state != targetting.GUI) {
			if (controlls == "Gamepad") {
				if (gamepad_button_check(device, gp_select)) and (!isStructEmpty(player_instance.items)) {
					player_instance.inventory_toggled = true;
				} else {
					player_instance.inventory_toggled = false;
				}
			} else {
				if (keyboard_check(ord("E"))) and (!isStructEmpty(player_instance.items)) {
					player_instance.inventory_toggled = true;
				} else {
					player_instance.inventory_toggled = false;
				}
			}
		}
		
		if (!player_instance.dead) and (player_instance.state != targetting.GUI) {
			/*
			if (keyboard_check_pressed(vk_anykey)) {
				local_data.controlls = "Keyboard";
				local_data.input_device = 0;
				global.player_data[$ player_order][$ "controlls"] = "Keyboard";
				global.player_data[$ player_order][$ "input_device"] = 0;
			}
			*/
			var moving = false;
			
			if (controlls == "Gamepad") {
				gamepad_set_axis_deadzone(device, 0.2);

				if (gamepad_axis_value(device, gp_axislh) < 0) and (!place_meeting(player_instance.x - 2, player_instance.y, oCollision)) {//if ((_input.left) and (!place_meeting(x - 2, y, oCollision))) {
					player_instance.move_state = move.RUNNING;
					//player_instance.direction = 270;
					player_instance.x -= 1;
					player_instance.image_speed = .5;
					player_instance.sprite_index = asset_get_index("sPlayerLeft" + string(player_ordr));
					moving = true;
				}

				if (gamepad_axis_value(device, gp_axislh) > 0) and (!place_meeting(player_instance.x + 2, player_instance.y, oCollision)) {//if ((_input.right) and (!place_meeting(x + 2, y, oCollision))) {
					player_instance.move_state = move.RUNNING;
					//player_instance.direction = 90;
					player_instance.x += 1;
					player_instance.image_speed = .5;
					player_instance.sprite_index = asset_get_index("sPlayerRight" + string(player_ordr));
					moving = true;
				}

				if (gamepad_axis_value(device, gp_axislv) > 0) and (!place_meeting(player_instance.x, player_instance.y + 2, oCollision)) {//if ((_input.down) and (!place_meeting(x, y + 2, oCollision))) {
					player_instance.move_state = move.RUNNING;
					//player_instance.direction = 180;
					player_instance.y += 1;
					player_instance.image_speed = .5;
					player_instance.sprite_index = asset_get_index("sPlayerDown" + string(player_ordr));
					moving = true;
				}

				if (gamepad_axis_value(device, gp_axislv) < 0) and (!place_meeting(player_instance.x, player_instance.y - 2, oCollision)) {//if ((_input.up) and (!place_meeting(x, y - 2, oCollision))) {
					player_instance.move_state = move.RUNNING;
					//player_instance.direction = 0;
					player_instance.y -= 1;
					player_instance.image_speed = .5;
					player_instance.sprite_index = asset_get_index("sPlayerUp" + string(player_ordr));
					moving = true;
				}
				
				if (gamepad_button_check_pressed(device, gp_shoulderrb)) and (!player_instance.swinging) and (!isStructEmpty(player_instance.weapon)) {
					var vaxis = gamepad_axis_value(device, gp_axisrv);
					var haxis = gamepad_axis_value(device, gp_axisrh);
					player_instance.swinging = true;
					player_instance.alarm[0] = player_instance.weapon[$ "cooldown"];
					
					if (player_instance.weapon[$ "slug"] == "bow") {
						var swing = instance_create_layer(player_instance.x, player_instance.y, "Instances", oProjectile);
						swing.owner = player_instance; // Set the owner of the sword swing to this instance
						swing.image_speed = .85;
						
						with (swing) {
							var arrow = instance_create_layer(player_instance.x + 8, player_instance.y + 8, "Instances", oArrow);
							with (arrow) {
								owner = player_instance;
								dir_x = haxis;
								dir_y = vaxis;
							}
						}
					} else {
						var swing = instance_create_layer(player_instance.x, player_instance.y, "Instances", oSwordSwing);
						swing.owner = player_instance; // Set the owner of the sword swing to this instance
						swing.image_speed = .85;
						swing.dir_x = haxis;
						swing.dir_y = vaxis;
		
						
						/*
						// Up
						if (player_instance.direction == 0) {
							swing.swing_direction = "up";
						}
		
						// Down
						if (player_instance.direction == 180) {
							swing.swing_direction = "down";
						}
		
						// Left
						if (player_instance.direction == 270) {
							swing.swing_direction = "left";
						}
		
						// Right
						if (player_instance.direction == 90) {
							swing.swing_direction = "right";
						}*/
					}
				}
			} else {
				if (keyboard_check(ord("A"))) and (!place_meeting(x - 2, y, oCollision)) {//if ((_input.left) and (!place_meeting(x - 2, y, oCollision))) {
					player_instance.move_state = move.RUNNING;
					player_instance.direction = 270;
					player_instance.x -= 1;
					player_instance.image_speed = .5;
					player_instance.sprite_index = asset_get_index("sPlayerLeft" + string(player_ordr));
					moving = true;
				}

				if (keyboard_check(ord("D"))) and (!place_meeting(x + 2, y, oCollision)) {//if ((_input.right) and (!place_meeting(x + 2, y, oCollision))) {
					player_instance.move_state = move.RUNNING;
					player_instance.direction = 90;
					player_instance.x += 1;
					player_instance.image_speed = .5;
					player_instance.sprite_index = asset_get_index("sPlayerRight" + string(player_ordr));
					moving = true;
				}

				if (keyboard_check(ord("S"))) and (!place_meeting(x, y + 2, oCollision)) {//if ((_input.down) and (!place_meeting(x, y + 2, oCollision))) {
					player_instance.move_state = move.RUNNING;
					player_instance.direction = 180;
					player_instance.y += 1;
					player_instance.image_speed = .5;
					player_instance.sprite_index = asset_get_index("sPlayerDown" + string(player_ordr));
					moving = true;
				}

				if (keyboard_check(ord("W"))) and (!place_meeting(x, y - 2, oCollision)) {//if ((_input.up) and (!place_meeting(x, y - 2, oCollision))) {
					player_instance.move_state = move.RUNNING;
					player_instance.direction = 0;
					player_instance.y -= 1;
					player_instance.image_speed = .5;
					player_instance.sprite_index = asset_get_index("sPlayerUp" + string(player_ordr));
					moving = true;
				}
				
				if point_in_rectangle(mx, my, obj_player.x, obj_player.y, obj_player.x + 16, obj_player.y + 16) {
					player_instance.state = targetting.ENEMY;
				}
				
				if (keyboard_check_pressed(vk_space)) and (player_instance.move_state == move.RUNNING) {
					switch (player_instance.direction) {
						case 0:
							player_instance.y -= 32;
						break;
						case 90:
							player_instance.x += 32;
						break;
						case 180:
							player_instance.y += 32;
						break;
						case 270:
							player_instance.x -= 32;
						break;
					}
				}

				if (mouse_check_button_pressed(mb_left)) and (!player_instance.swinging) and (!isStructEmpty(player_instance.weapon)) {
					player_instance.swinging = true;
	
					player_instance.alarm[0] = player_instance.weapon[$ "cooldown"];
	
					var mouse_direction = point_direction(player_instance.x + 8, player_instance.y + 8, mx, my);
	
					var swing = instance_create_layer(player_instance.x, player_instance.y, "Instances", oSwordSwing);
					swing.owner = player_instance; // Set the owner of the sword swing to this instance
					swing.image_speed = .85;
	
					// Up
					if ((mouse_direction >= 45 and mouse_direction <= 135)) {
						swing.swing_direction = "up";
					}
		
					// Down
					if ((mouse_direction >= 225 and mouse_direction <= 315)) {
						swing.swing_direction = "down";
					}
		
					// Left
					if ((mouse_direction >= 136 and mouse_direction <= 224)) {
						swing.swing_direction = "left";
					}
		
					// Right
					if ((mouse_direction >= 0 and mouse_direction <= 44) or (mouse_direction >= 316 and mouse_direction <= 360)) {
						swing.swing_direction = "right";
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
}