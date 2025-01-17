if (device == "Keyboard") {
	// Check the distance to the target
	if (point_distance(owner.x, owner.y, x, y) < itemData.range) {
	    move_towards_point(dir_x, dir_y, speed);
	} else {
	    speed = 0;
		image_index = 1;
		arrow_dir = 0;
	}
	
	if (point_distance(x, y, dir_x, dir_y) < 2) and (point_distance(x, y, dir_x, dir_y) > -2) {
		speed = 0;
		image_index = 1;
		arrow_dir = 0;
	}
} else if (device == "Gamepad") {
	if (dir_x != 0 || dir_y != 0) and (point_distance(owner.x, owner.y, x, y) < itemData.range) {
	    // Move towards the target point
	    move_towards_point(x + dir_x, y + dir_y, speed);
	} else {
	    speed = 0;
		image_index = 1;
		arrow_dir = 0;
	}
	
	if (point_distance(x, y, dir_x, dir_y) < 2) and (point_distance(x, y, dir_x, dir_y) > -2) {
		speed = 0;
		image_index = 1;
		arrow_dir = 0;
	}
	
	var dead_zone = 0.1;
	
	if (abs(dir_x) < dead_zone) dir_x = 0;
	if (abs(dir_y) < dead_zone) dir_y = 0;

	var target_x = x + dir_x * 100; // Scale the direction to a reasonable distance
	var target_y = y + dir_y * 100; // Scale the direction to a reasonable distance
	
	arrow_dir = point_direction(x + 8, y + 8, target_x, target_y) - 90;
	image_angle = arrow_dir;
}

if (oSaveLoad.stage == stages.FIGHT) and (speed = 0) {
	instance_destroy();
}

/*
if (has_hit == true) {
	var xx = hit_player.x - x;
	var yy = hit_player.y - y;
	x += xx;
	y += yy;
}
*/


