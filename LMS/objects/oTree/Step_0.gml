depth = -y;

var nearest_player = instance_nearest(x, y, obj_player);
var distanceFromPlayer = point_distance(nearest_player.x, nearest_player.y, x, y);
var player_device = nearest_player.local_data[$ "input_device"];
var player_rd = nearest_player.local_data[$ "player_order"];
var player_instance = nearest_player.local_data[$ "player_instance"];

if (state == tree.IDLE) {
	sprite_index = itemData.parent_s;
	image_index = 0;
	
	// Player Initial Interaction
	if (distanceFromPlayer <= 18) {
		player_order = player_rd;
		
		
		if (keyboard_check_pressed(ord("F"))) or (gamepad_button_check(player_device, gp_face3))  {
			player = player_instance;
			state = tree.CHOPPING;
			alarm[0] = time_to_chop;
			player.state = targetting.GUI;
			player.move_state = move.CHOPPING;
		}
	} else {
		player = noone;
	}
}

if (state == tree.CHOPPING) and (player != noone) and (ready == true) {
	ready = false;
	player.move_state = move.CHOPPING;
	
	var chopping_anim = instance_create_layer(x + 4, y + 4, "Instances", oSkillAnimation);
	with (chopping_anim) {
		owner = other.id;
		skill = "Forrestry";
	}
}

switch chooseSprite {
	case 1:
		sprite_index = sOak1;
	break;
	case 2:
		sprite_index = sOak2;
	break;
	case 3:
		sprite_index = sOak3;
	break;
}

/*
if ready == false && image_index == 0 && global.Chopping == false {
	show_message("WHAT!");
	audio_stop_sound(treeSound);
	image_index = 0;
	alarm[0] = -1;
	ready = true;
}
*/

if (alarm[0] > 0) and (distanceFromPlayer > 18) and (player == noone) {
	stop_chopping(0);
	temp_message(x, y, "Chopping Cancelled", c_white);
	image_index = 0;
	alarm[0] = -1;
	ready = true;
}


if (state == tree.CHOPPING) and (distanceFromPlayer > 18) and (player == noone) {
	temp_message(x, y, "Chopping Cancelled", c_white);
	image_index = 0;
	state = tree.IDLE;
	player = noone;
	player_order = noone;
	ready = true;
}