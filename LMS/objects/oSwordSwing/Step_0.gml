if (owner != noone) {
	sprite_index = owner.weapon[$ "atk_anim"];
	
	switch (attack_direction) {
		case "Up":
			image_yscale = -1;
		
			image_angle = 270;
			x = owner.x + 16;
			y = owner.y;
		break;
		case "Down":
			depth = -y;
			
			image_angle = 270;
			x = owner.x + 16;
			y = owner.y;
		break;
		case "Left":
			depth = -y;
			image_xscale = -1;
			x = owner.x - 16;
		break;
		case "Right":
			depth = -y;
			x = owner.x;
			y = owner.y;
		break;
	}
}

if (image_index >= (image_number - .5)) {
	owner.move_state = move.IDLE;
	player_idling(owner, owner_order);
	instance_destroy();
}