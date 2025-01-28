function split_screen_cameras(count) {
	var left = 99999, top = 99999, right = -99999, bottom = -99999;

	// Distance threshold for enabling the ADAPT state
	var max_distance = 32;

	// First loop: Determine the bounding box
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

	// Calculate the center of the bounding box
	var center_x = (left + right) / 2;
	var center_y = (top + bottom) / 2;

	// Check distances for all players
	var all_players_close = true; // Assume all players are close
	for (var i = 0; i < count; i++) {
	    var player_instance = global.player_data[$ i][$ "player_instance"];
    
	    if (instance_exists(player_instance)) {
	        var px = player_instance.x;
	        var py = player_instance.y;
        
	        // If any player is too far from the center, set flag to false
	        if (point_distance(center_x, center_y, px, py) > max_distance) {
	            //all_players_close = false;
	            //break; // No need to check further
	        }
	    }
	}

	// Update the screen state only if all players are close and the stage is valid
	if (all_players_close && oSaveLoad.stage != stages.init_PREP) {
	    //state = screen.ADAPT;
	} else {
	    // Optional: Handle other states if needed
	}

	// Second loop: Configure split-screen views
	var ss_start_pos_x = 0;
	var ss_start_pos_y = 0;
	var ratio = (count > 2) ? 2 : 1;

	for (var i = 0; i < count; i++) {
	    var player_instance = global.player_data[$ i][$ "player_instance"];

	    switch (i) {
	        case 0: ss_start_pos_x = 0; break;
	        case 1: ss_start_pos_x = global.res_width; break;
	        case 2: ss_start_pos_x = 0; ss_start_pos_y = global.res_height; break;
	        case 3: ss_start_pos_x = global.res_width; ss_start_pos_y = global.res_height; break;
	    }

	    // Configure view for each player
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