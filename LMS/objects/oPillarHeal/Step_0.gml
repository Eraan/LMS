depth = -y;

if (instance_exists(obj_player)) {
	player = global.player_id;
}

var distanceFromPlayer = point_distance(player.x, player.y, x, y);

if (state = pillar.IDLE) and (distanceFromPlayer <= 20) {
	image_speed = 0.25;
	state = pillar.ELEVATING;
}

if (state = pillar.ELEVATING) and (image_index >= 7) {
	image_index = 8;
	image_speed = 0;
	state = pillar.ERECT;
}

if (state = pillar.ERECT) and (distanceFromPlayer >= 20) {
	image_speed = -0.25;
	state = pillar.COLLAPSING;
}

if (state = pillar.COLLAPSING) and (image_index <= 0) {
	image_speed = 0;
	state = pillar.IDLE;
}