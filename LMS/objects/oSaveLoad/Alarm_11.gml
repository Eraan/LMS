/// @Enemy Spawn Rate
randomize();
var pillar_n = irandom_range(0, 1);
var pillar_id = instance_find(oPillar, pillar_n);

if (stage != stages.FIGHT) {
	if (enemy_count < 4) {
		instance_create_layer(pillar_id.x + 16, pillar_id.y + 16, "Instances", oEnemy);
		enemy_count += 1;
	} else {
		show_debug_message("Max Spawn");
	}

	alarm[11] = 120;
} else {
	alarm[11] = -1;
}