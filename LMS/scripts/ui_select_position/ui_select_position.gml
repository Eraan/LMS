/// @ This struct applies to generic selection slots (4 Slots Wide and 3 Slots Tall).
function ui_select_position(player_device, struct, position) {
	if (position > 3) and 
		(struct_names_count(struct) > 4) and
		(gamepad_button_check_pressed(player_device, gp_padu)) {
		position -= 4;
	}
	
	if (position < 4) and 
		(struct_names_count(struct) > 4) and
		(gamepad_button_check_pressed(player_device, gp_padd)) {
		position += 4;
	}
	
	if (position < 8) and 
		(struct_names_count(struct) > 8) and
		(gamepad_button_check_pressed(player_device, gp_padd)) {
		position += 4;
	}
	
	if (position != 0) and 
		(position != 4) and 
		(position != 8) and 
		(gamepad_button_check_pressed(player_device, gp_padl)) {
		position -= 1;
	}
	
	if (position != 3) and 
		(position != 7) and
		(position != 11) and
		(position != (struct_names_count(struct) - 1)) and
		(gamepad_button_check_pressed(player_device, gp_padr)) {
		position += 1;
	}
	
	return position;
}