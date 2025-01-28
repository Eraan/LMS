if (instance_exists(obj_player)) and (room != rLobby) {
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
	}

	if (state == screen.ADAPT) {
		//adaptive_camera(count);
	}
	
	if (state == screen.SPLIT) {
		split_screen_cameras(count)
	}
} else {
	view_enabled = true;
	view_visible[0] = true;
	view_visible[1] = false;
	view_visible[2] = false;
	view_visible[3] = false;
	
	var _cam = camera_create_view(0, 0, global.res_width / 3, global.res_height / 3);
		
	camera_set_view_target(_cam, oGUI);
	camera_set_view_border(_cam, global.res_width / 6, global.res_height / 6);

	view_hport[0] = global.res_height;
	view_wport[0] = global.res_width;

	view_camera[0] = _cam;
}


if (oSaveLoad.stage == stages.PENDING) {
	var count = variable_struct_names_count(global.player_data);
		
	if (count >= 1) and (alarm[0] = -1) {
		alarm[0] = 240;
		var player_one = instance_create_layer(50, global.res_height / 2 - 95, "Instances", oNullObjection);
			
		with player_one {
			
			sprite_index = asset_get_index("sPlayerRight" + string(irandom_range(0, (count - 1))));	
			speed = 0.5;
			image_speed = 0.5;
			//x += .5;
			move_towards_point(360, global.res_height / 2 - 95, speed);
		}
	}
}

