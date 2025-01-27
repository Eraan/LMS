if (oSaveLoad.enemy_count < 6) {
	state = enemy.DUPLICATING;
	sprite_index = sSlimeDuplicate;
	
	if (!place_meeting(x + 16, y, oCollision)) {
		oSaveLoad.enemy_count += 1;
		instance_create_layer(x+ 16, y, "Instances", oEnemy);
	}

	if (state != enemy.DEAD) {
		alarm[1] = 600;
	}
} else {
	show_debug_message("Too many enemies!!");	
}