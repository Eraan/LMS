// 3/4 Closed - Barrier Top
if (place_meeting(x, y - 16, oBarrier)) and 
(place_meeting(x + 16, y, oFloor)) and 
(place_meeting(x - 16, y, oFloor)) and 
(place_meeting(x, y + 16, oFloor)) {
	instance_create_layer(x, y, "Base", oFloor);
	instance_destroy();
}

// 3/4 Closed - Barrier Right
if (place_meeting(x + 16, y, oBarrier)) and 
(place_meeting(x - 16, y, oFloor)) and 
(place_meeting(x, y + 16, oFloor)) and 
(place_meeting(x, y - 16, oFloor)) {
	instance_create_layer(x, y, "Base", oFloor);
	instance_destroy();
}

// 3/4 Closed - Barrier Bottom
if (place_meeting(x, y + 17, oBarrier)) and 
(place_meeting(x + 16, y, oFloor)) and 
(place_meeting(x - 16, y + 16, oFloor)) and 
(place_meeting(x, y - 16, oFloor)) {
	show_debug_message("Hit a rut");
	instance_create_layer(x, y, "Base", oFloor);
	instance_destroy();
}

// 3/4 Closed - Barrier Left
if (place_meeting(x - 16, y, oBarrier)) and 
(place_meeting(x + 16, y, oFloor)) and 
(place_meeting(x, y + 16, oFloor)) and 
(place_meeting(x, y - 16, oFloor)) {
	instance_create_layer(x, y, "Base", oFloor);
	instance_destroy();
}

// Fully Enclosed
if (position_meeting(x + 16, y, oFloor)) and 
(position_meeting(x - 16, y, oFloor)) and 
(position_meeting(x, y + 16, oFloor)) and 
(position_meeting(x, y - 16, oFloor)) {
	//image_index = 12;
	instance_create_layer(x, y, "Base", oFloor);
	instance_destroy();
}


// Top Left Corner
if (position_meeting(x + 16, y, oBarrier)) and (position_meeting(x, y + 16, oBarrier)) {
	
	if (position_meeting(x + 16, y + 16, oFloor)) {
		image_index = 4;
	}
}
// Top Right Corner
if (position_meeting(x - 16, y, oBarrier)) and (position_meeting(x, y + 16, oBarrier)) {
	
	if (position_meeting(x - 16, y + 16, oFloor)) {
		image_index = 5;
	}
}

// Bottom Left Corner
if (position_meeting(x + 16, y, oBarrier)) and (position_meeting(x, y - 16, oBarrier)) {
	
	if (position_meeting(x + 16, y - 16, oFloor)) {
		image_index = 6;
	}
}

// Bottom Right Corner
if (position_meeting(x, y - 16, oBarrier)) and (position_meeting(x - 16, y, oBarrier)) {
	
	if (position_meeting(x - 16, y - 16, oFloor)) {
		image_index = 7;
	}
}

// Top Left DOT
if (position_meeting(x - 16, y, oBarrier)) and (position_meeting(x, y - 16, oBarrier)) {
	
	if (position_meeting(x + 16, y, oFloor)) {
		image_index = 8;
	}
}

// Top Right DOT
if (position_meeting(x + 16, y, oBarrier)) and (position_meeting(x, y - 16, oBarrier)) {
	
	if (position_meeting(x - 16, y, oFloor)) and (position_meeting(x, y + 16, oFloor)) {
		image_index = 9;
	}
}

// Bottom Left DOT
if (position_meeting(x - 16, y, oBarrier)) and (position_meeting(x, y + 16, oBarrier)) {
	
	if (position_meeting(x + 16, y, oFloor)) and (position_meeting(x, y - 16, oFloor))  {
		image_index = 10;
	}
}

// Bottom Right DOT
if (position_meeting(x + 16, y, oBarrier)) and (position_meeting(x, y + 16, oBarrier)) {
	
	if (position_meeting(x - 16, y, oFloor)) and (position_meeting(x, y - 16, oFloor))  {
		image_index = 11;
	}
}

if (position_meeting(x + 16, y, oBarrier)) and (position_meeting(x - 16, y, oBarrier)) {
	// Top
	if (position_meeting(x, y + 16, oFloor)) {
		image_index = 0;
	}
	// Bottom
	if (position_meeting(x, y - 16, oFloor)) {
		image_index = 2;
	}
}

if (position_meeting(x, y - 16, oBarrier)) and (position_meeting(x, y + 16, oBarrier)) {
	// Left
	if (position_meeting(x - 16, y, oFloor)) {
		image_index = 1;
	}
	// Right
	if (position_meeting(x + 16, y, oFloor)) {
		image_index = 3;
	}
}