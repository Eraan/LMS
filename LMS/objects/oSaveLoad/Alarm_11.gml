/// @Enemy Spawn Rate
if (enemy_count < 4) {
	instance_create_layer(oPillar.x + 16, oPillar.y + 16, "Instances", oEnemy);
	enemy_count += 1;
} else {
	show_debug_message("Max Spawn");
}

alarm[11] = 120;