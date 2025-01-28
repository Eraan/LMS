function adaptive_camera(count) {
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
	var padding = 64; // Add some padding around the players
	var min_width = 300; // Minimum camera width
	var min_height = 200; // Minimum camera height
	var max_width = global.res_width / 3; // Maximum camera width
	var max_height = global.res_height / 3; // Maximum camera height

	// Initialize bounding box variables
	var left = 99999, top = 99999, right = -99999, bottom = -99999;
	
	// Mini-View | Distance threshold for adding mini-views
	var max_distance = 32;

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
			
			// Check Player Distances for Camera Adjustments
		    var center_x = (left + right) / 2;
		    var center_y = (top + bottom) / 2;
		    if (point_distance(center_x, center_y, px, py) > max_distance) {
				state = screen.SPLIT;
		        exit;
		    }
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
}