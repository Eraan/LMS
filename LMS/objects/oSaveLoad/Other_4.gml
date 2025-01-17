var count = variable_struct_names_count(global.player_data);
show_debug_message(count);

for (var i = 0; i < count; i++) {
	show_debug_message(global.player_data[$ i][$ "player_instance"]);
	var player_instance = global.player_data[$ i][$ "player_instance"];
	var player_start_pos = instance_find(oPlayerStart, i);
	
	if (player_start_pos != noone) {
		player_instance.x = player_start_pos.x;
		player_instance.y = player_start_pos.y;
	} else {
	    show_debug_message("Error: No valid oPlayerStart instance for index: " + string(i));
	}
}