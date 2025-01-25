depth = owner.depth - 1;

switch (skill) {
	case "Forrestry":
		sprite_index = sChopping;
	
		if (owner.state != tree.CHOPPING) {
			instance_destroy();	
		}
		
		if (image_index == 4) {
			audio_play_sound(woodChopSound, 10, false);
		}
	break;
	case "Mining":
		sprite_index = sMining;
		
		if (owner.state != mining_state.MINING) {
			instance_destroy();	
		}
		
		if (image_index == 4) {
			audio_play_sound(miningSound, 10, false);
		}
	break;
}

