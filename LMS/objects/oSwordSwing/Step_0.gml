if (owner != noone) {
	sprite_index = asset_get_index(string(owner.weapon[$ "atk_anim"]) + string(attack_direction));
	
	switch (attack_direction) {
		case "Up":
			x = owner.x;
			y = owner.y;
		break;
		case "Down":
			depth = owner.depth - 1;
			x = owner.x;
			y = owner.y;
		break;
		case "Left":
			depth = -y;
			x = owner.x;
			y = owner.y;
		break;
		case "Right":
			depth = -y;
			x = owner.x;
			y = owner.y;
		break;
	}
}

//show_debug_message("Image Index: " + string(image_index));

if (image_index >= (image_number - .50)) {
	alarm[0] = 1;
}