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

	if (state == screen.ADAPT) {
		
		// Enable the view
		view_enabled = true;
		view_visible[0] = true;
		view_visible[1] = false;
		view_visible[2] = false;
		view_visible[3] = false;

		// Create the camera
		var _cam = camera_create_view(0, 0, global.res_width / 3, global.res_height / 3);
		view_camera[0] = _cam;

		// Variables for padding and limits
		var padding = 50; // Add some padding around the players
		var min_width = 300; // Minimum camera width
		var min_height = 200; // Minimum camera height
		var max_width = global.res_width; // Maximum camera width
		var max_height = global.res_height; // Maximum camera height

		// Initialize bounding box variables
		var left = 99999, top = 99999, right = -99999, bottom = -99999;

		// Iterate over all players stored in global.player_data
		for (var i = 0; i < count; i++) {
		    var player_instance = global.player_data[$ i][$ "player_instance"];
		    if (instance_exists(player_instance)) {
		        var px = player_instance.x;
		        var py = player_instance.y;
        
		        // Update the bounding box
		        if (px < left) left = px;
		        if (px > right) right = px;
		        if (py < top) top = py;
		        if (py > bottom) bottom = py;
		    }
		}

		// Calculate bounding box dimensions
		var box_width = (right - left) + (padding * 2);
		var box_height = (bottom - top) + (padding * 2);

		// Preserve the aspect ratio
		var aspect_ratio = global.res_width / global.res_height;

		// Adjust camera dimensions based on the bounding box
		var cam_width, cam_height;
		if (box_width / box_height > aspect_ratio) {
		    // Width dominates, calculate height from aspect ratio
		    cam_width = clamp(box_width, min_width, max_width);
		    cam_height = cam_width / aspect_ratio;
		} else {
		    // Height dominates, calculate width from aspect ratio
		    cam_height = clamp(box_height, min_height, max_height);
		    cam_width = cam_height * aspect_ratio;
		}

		// Clamp the camera size to within the limits
		cam_width = clamp(cam_width, min_width, max_width);
		cam_height = clamp(cam_height, min_height, max_height);

		// Center the camera on the players
		var cam_x = (left + right) / 2 - cam_width / 2;
		var cam_y = (top + bottom) / 2 - cam_height / 2;

		// Update the camera view
		camera_set_view_size(_cam, cam_width, cam_height);
		camera_set_view_pos(_cam, cam_x, cam_y);

		// Update the port to maintain proper scaling
		view_hport[0] = global.res_height;
		view_wport[0] = global.res_width;

		/*
		view_enabled = true;
		view_visible[0] = true;
		view_visible[1] = false;
		view_visible[2] = false;
		view_visible[3] = false;
	
		var _cam = camera_create_view(0, 0, global.res_width / 3, global.res_height / 3);
		
		camera_set_view_target(_cam, oArena);
		camera_set_view_border(_cam, global.res_width / 6, global.res_height / 6);

		view_hport[0] = global.res_height;
		view_wport[0] = global.res_width;

		view_camera[0] = _cam;
		*/
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

