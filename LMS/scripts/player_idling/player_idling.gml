function player_idling(player_instance, player_order) {
	if (player_instance.idle_timer == undefined) {
		player_instance.idle_timer = irandom_range(600, 3000);
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
			//player_instance.image_speed = 0;

			// Reset idle timer and random action
			player_instance.idle_timer = irandom_range(600, 3000);
			player_instance.idle_action = irandom_range(0, 3);
		}
	}
}