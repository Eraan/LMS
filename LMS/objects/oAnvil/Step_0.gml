depth = -y;

var nearest_player = instance_nearest(x, y, obj_player);
var distanceFromPlayer = point_distance(nearest_player.x, nearest_player.y, x, y);
var player_device = nearest_player.local_data[$ "input_device"];
var player_rd = nearest_player.local_data[$ "player_order"];

if (state == anvil.EMPTY) {
	image_index = 0;
	
	// Player Initial Interaction
	if (distanceFromPlayer <= 16) {
		player_order = player_rd;
		if (keyboard_check_pressed(ord("F"))) or (gamepad_button_check_pressed(player_device, gp_face3))  {
			player = nearest_player;
			global.selected_anvil = id;
			state = anvil.PICKING;
			nearest_player.state = targetting.GUI;
		}
	}
}

if (state == anvil.PICKING) {
	// Scrolling Up
	if (mouse_wheel_up()) or (gamepad_button_check_pressed(player_device, gp_padu)) {
		selection_position += 1;
	}
	
	if (selection_position > (struct_names_count(items) - 1)) and (mouse_wheel_up() or gamepad_button_check_pressed(player_device, gp_padu)) {
		selection_position = 0;
	}
	
	// Scrolling Down
	if (mouse_wheel_down()) or (gamepad_button_check_pressed(player_device, gp_padd)) {
		selection_position -= 1;
	}
	
	if (selection_position == -1) and (mouse_wheel_down() or gamepad_button_check_pressed(player_device, gp_padd)) {
		selection_position = struct_names_count(items) - 1
	}
}

if (state == anvil.PICKING) and (mouse_check_button_pressed(mb_right) or (gamepad_button_check(player_device, gp_face2))) {
	state = anvil.EMPTY;
	nearest_player.state = targetting.NULL;
}