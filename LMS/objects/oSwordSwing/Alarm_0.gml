owner.move_state = move.IDLE;
player_idling(owner, owner_order);

image_index = image_number - 1;
image_speed = 0;
show_debug_message("Index: " + string(image_index));
show_debug_message("Image Number: " + string(image_number));

if (image_index == image_number - 1) {
	instance_destroy();
}