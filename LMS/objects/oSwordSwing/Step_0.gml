depth = -y;

if (owner != noone) {
    x = owner.x + 8;
    y = owner.y + 8;
	sprite_index = owner.weapon[$ "atk_anim"];
}

if (device == "Keyboard") {
	atk_dir = point_direction(x + 8, y + 8, dir_x, dir_y) - 90;
	image_angle = atk_dir;
} else if (device == "Gamepad") {
	var dead_zone = 0.1;
	if (abs(dir_x) < dead_zone) dir_x = 0;
	if (abs(dir_y) < dead_zone) dir_y = 0;

	var target_x = x + dir_x * 100; // Scale the direction to a reasonable distance
	var target_y = y + dir_y * 100; // Scale the direction to a reasonable distance

	atk_dir = point_direction(x + 8, y + 8, target_x, target_y) - 90;
	image_angle = atk_dir;
}

/*
switch (swing_direction) {
	case "up":
		sprite_index = attack_animation;
		image_angle = 0;
		x = x + 8;
		y = y + 8;
	break;
	case "down":
		sprite_index = attack_animation;
		image_angle = 180;
		x = x + 8;
		y = y + 12;
	break;
	case "left":
		sprite_index = attack_animation;
		image_angle = 90;
		x = x + 5;
		y = y + 8;
	break;
	case "right":
		sprite_index = attack_animation;
		image_angle = 270;
		x = x + 12;
		y = y + 8;
	break;
}
*/

if (image_index >= 6.75) {
	instance_destroy();
}