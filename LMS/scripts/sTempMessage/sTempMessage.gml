function temp_message(message_x, message_y, temporary_message, color) {
	var new_message = instance_create_layer(message_x + 8, message_y - 4, "GUI", oTempMessage)
	
	with new_message {
		drawMessage = true;
		tempMessage = temporary_message;
		messageColor = color;
	}
}
