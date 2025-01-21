if (keyboard_check_pressed(vk_space)) {
	state = tab.ACHIEVEMENTS;
}

if (keyboard_check_pressed(vk_tab)) {
	room_goto(rLobby);
}

if (gamepad_is_connected(4)) {
    if (gamepad_button_check_pressed(4, gp_face1)) {
        show_debug_message("A button pressed!");
    }
}