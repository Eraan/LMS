depth = -y;

// Get player input
var move_x = 0;
var move_y = 0;

// Get input for a specific player
var _input = rollback_get_input();

// Check input keys
if (_input.left) x -= 1;
if (_input.right) x += 1;
if (_input.up) y -= 1;
if (_input.down) y += 1;

// Normalize the direction for diagonal movement
var move_length = point_distance(0, 0, move_x, move_y);
if (move_length > 0) {
    move_x /= move_length;
    move_y /= move_length;
}

// Ensure valid acceleration range
acceleration = clamp(acceleration, 0, 1);

// Ensure move_speed is non-zero
if (move_speed > 0) {
    // Apply acceleration and clamp speed to avoid extreme values
    hsp = clamp(lerp(hsp, move_x * move_speed, acceleration), -max_speed, max_speed);
    vsp = clamp(lerp(vsp, move_y * move_speed, acceleration), -max_speed, max_speed);
} else {
    hsp = 0;
    vsp = 0;
}

// Validate hsp and vsp to prevent NaN or infinite values
if (!is_real(hsp) || !is_real(vsp)) {
    hsp = 0;
    vsp = 0;
}

show_debug_message("hsp: " + string(hsp) + ", vsp: " + string(vsp) + 
                   ", move_x: " + string(move_x) + ", move_y: " + string(move_y) + 
                   ", acceleration: " + string(acceleration));

// Apply friction if no input
if (move_x == 0) hsp = lerp(hsp, 0, fric);
if (move_y == 0) vsp = lerp(vsp, 0, fric);

// Handle horizontal movement with collision
/*
if (place_meeting(x + hsp, y, oCollision)) {
    while (!place_meeting(x + sign(hsp), y, oCollision)) {
        x += sign(hsp); // Move player along x until no collision
    }
    hsp = 0; // Stop horizontal movement if colliding
} else {
    x += hsp; // Move player along x if no collision
}

// Handle vertical movement with collision
if (place_meeting(x, y + vsp, oCollision)) {
    while (!place_meeting(x, y + sign(vsp), oCollision)) {
        y += sign(vsp); // Move player along y until no collision
    }
    vsp = 0; // Stop vertical movement if colliding
} else {
    y += vsp; // Move player along y if no collision
}*/

// Dash input
if (_input.dash && dash_timer <= 0) {
    // Start dashing
    is_dashing = true;
    dash_timer = dash_duration + dash_cooldown;

    // Store dash direction (current input or last input)
    if (move_x != 0 || move_y != 0) {
        dash_direction_x = move_x;
        dash_direction_y = move_y;
    }
    // If no input, dash in the last movement direction
    else {
        dash_direction_x = sign(hsp);
        dash_direction_y = sign(vsp);
    }
}

// Dash logic
if (is_dashing) {
    var dash_x = dash_direction_x * dash_speed;
    var dash_y = dash_direction_y * dash_speed;

    // Move the player incrementally during dash
    for (var i = 0; i < dash_speed; i++) {
        // Check horizontal collision
        if (!place_meeting(x + sign(dash_x), y, oCollision)) {
            x += sign(dash_x); // Move 1 pixel at a time horizontally
        } else {
            dash_x = 0; // Stop horizontal movement if colliding
        }

        // Check vertical collision
        if (!place_meeting(x, y + sign(dash_y), oCollision)) {
            y += sign(dash_y); // Move 1 pixel at a time vertically
        } else {
            dash_y = 0; // Stop vertical movement if colliding
        }

        // If both directions are blocked, stop the dash
        if (dash_x == 0 && dash_y == 0) {
            is_dashing = false;
            dash_timer = dash_cooldown; // Reset cooldown
            break;
        }
    }

    // Reduce dash duration
    dash_timer--;
    if (dash_timer <= dash_cooldown) {
        is_dashing = false; // End dash
    }
}

// Reduce dash cooldown
if (dash_timer > 0) {
    dash_timer--;
}



// Sword swing input
if (_input.interact && !swinging) { // if (_input.interact && !swinging && global.userStats.weapon != noone)
    swinging = true;
	
	var mouse_direction = point_direction(id.x + 8, id.y + 8, mouse_x, mouse_y);
	
	var swing = instance_create_layer(x, y, "Instances", oSwordSwing);
	swing.owner = id; // Set the owner of the sword swing to this instance
	
	show_debug_message(swing.owner);
	
	with (swing) {
		image_speed = .75;
		
		// Up
		if ((mouse_direction >= 45 and mouse_direction <= 135)) {
			swing_direction = "up";
		}
		
		// Down
		if ((mouse_direction >= 225 and mouse_direction <= 315)) {
			swing_direction = "down";
		}
		
		// Left
		if ((mouse_direction >= 136 and mouse_direction <= 224)) {
			swing_direction = "left";
		}
		
		// Right
		if ((mouse_direction >= 0 and mouse_direction <= 44) or (mouse_direction >= 316 and mouse_direction <= 360)) {
			swing_direction = "right";
		}
	}
	
	alarm[0] = 30; //alarm[0] = global.userStats.weapon[$ "cooldown"];
	
	swing.player = self;
}
