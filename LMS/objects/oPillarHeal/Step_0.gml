depth = -y;

var nearest_player = instance_nearest(x, y, obj_player);
var distance_from_player = point_distance(nearest_player.x, nearest_player.y, x, y);
var player_instance = nearest_player.local_data[$ "player_instance"];

if (state = pillar.IDLE) and (distance_from_player <= 20) {
	image_speed = 0.40;
	state = pillar.ELEVATING;
}

if (state = pillar.ELEVATING) and (image_index > 7) {
	image_index = 8;
	image_speed = 0;
	state = pillar.ERECT;
}

if (state = pillar.ERECT) and (distance_from_player <= 20) {
	if (nearest_player.local_data.hp < 20) {
		nearest_player.local_data.hp += .05;
		temp_message(x, y, "+ .05 HP", c_green);
	}
}

if (state = pillar.ERECT) and (distance_from_player > 20) {
	image_speed = -0.40;
	state = pillar.COLLAPSING;
}

if (state = pillar.COLLAPSING) and (image_index <= 0) {
	image_speed = 0;
	state = pillar.IDLE;
}