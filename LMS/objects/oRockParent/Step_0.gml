depth = -y;

var nearest_player = instance_nearest(x, y, obj_player);
var distanceFromPlayer = point_distance(nearest_player.x, nearest_player.y, x, y);
var player_device = nearest_player.local_data[$ "input_device"];
var player_rd = nearest_player.local_data[$ "player_order"];
var player_instance = nearest_player.local_data[$ "player_instance"];

if (state == mining_state.IDLE) {
	image_index = 0;
	
	// Player Initial Interaction
	if (distanceFromPlayer <= 18) {
		player_order = player_rd;
		if (keyboard_check_pressed(ord("F"))) or (gamepad_button_check(player_device, gp_face3))  {
			player = player_instance;
			//global.selected_planter = id;
			state = mining_state.MINING;
			start_chopping(time_to_mine);
			nearest_player.state = targetting.GUI;
		}
	} else {
		player = noone;
	}
}

if (state == mining_state.MINING) {
	//
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