var _size = ds_list_size(inventory);

for (var i = 0; i < _size; i++) {
	var _item = inventory[| i];

	var _x = 300;
	var _y = 300 + 30 * i;

	draw_set_color(c_white);
	draw_text(_x, _y, string(_item));
}



// Draw the message at the top of the GUI
draw_set_color(c_white);
draw_set_font(-1); // Use the default font
draw_text(view_wport[0] / 2, 4, buffer_message); // Draw at coordinates (10, 10)