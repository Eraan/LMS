if (state == screen.SOLO) {
	var player_instance = obj_player;
	
	view_enabled = true;
	view_visible[0] = true;
	
	var _cam = camera_create_view(0, 0, global.res_width / 4, global.res_height / 4);
		
	camera_set_view_target(_cam, player_instance);
	camera_set_view_border(_cam, global.res_width / 8, global.res_height / 8);

	view_hport[0] = global.res_height;
	view_wport[0] = global.res_width;

	view_camera[0] = _cam;
}

var count = variable_struct_names_count(global.player_data);

if (state != screen.ADAPT) and (count > 1) {
	state = screen.SPLIT;
	for (var i = 0; i < count; i++) {
		var player_instance = global.player_data[$ i][$ "player_instance"];
		
		var ss_start_pos_x = 0;
		var ss_start_pos_y = 0;
		var ratio = 1;
		
		if (count > 2) {
			ratio = 2;	
		}
		
		switch (i) {
			case 0:
				ss_start_pos_x = 0;
			break;
			case 1:
				ss_start_pos_x = global.res_width;
			break;
			case 2:
				ss_start_pos_x = 0;
				ss_start_pos_y = global.res_height;
			break;
			case 3:
				ss_start_pos_x = global.res_width;
				ss_start_pos_y = global.res_height;
			break;
		}
	
		view_enabled = true;
		view_visible[i] = true;
	
		var _cam = camera_create_view(0, 0, global.res_width / 8, global.res_height / (4 * ratio));
		
		camera_set_view_target(_cam, player_instance);
		camera_set_view_border(_cam, global.res_width / 16, global.res_height / (8 * ratio));

		view_hport[i] = global.res_height;
		view_wport[i] = global.res_width;
		view_xport[i] = ss_start_pos_x;
		view_yport[i] = ss_start_pos_y;

		view_camera[i] = _cam;
	}
}

if (state = screen.ADAPT) {
	view_enabled = true;
	view_visible[0] = true;
	view_visible[1] = false;
	view_visible[2] = false;
	view_visible[3] = false;
	
	var _cam = camera_create_view(0, 0, global.res_width / 2, global.res_height / 2);
		
	camera_set_view_target(_cam, oArena);
	camera_set_view_border(_cam, global.res_width / 4, global.res_height / 4);

	view_hport[0] = global.res_height;
	view_wport[0] = global.res_width;

	view_camera[0] = _cam;
}