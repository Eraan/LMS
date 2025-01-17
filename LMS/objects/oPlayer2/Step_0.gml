depth = -y;

// Get player input
var move_x = 0;
var move_y = 0;

// Check arrow key input
if (keyboard_check(vk_left)) move_x -= 1;
if (keyboard_check(vk_right)) move_x += 1;
if (keyboard_check(vk_up)) move_y -= 1;
if (keyboard_check(vk_down)) move_y += 1;

// Normalize the direction for diagonal movement
var move_length = point_distance(0, 0, move_x, move_y);
if (move_length > 0) {
    move_x /= move_length;
    move_y /= move_length;
}

// Apply acceleration
hsp = lerp(hsp, move_x * move_speed, acceleration);
vsp = lerp(vsp, move_y * move_speed, acceleration);

// Apply friction if no input
if (move_x == 0) hsp = lerp(hsp, 0, fric);
if (move_y == 0) vsp = lerp(vsp, 0, fric);

// Handle horizontal movement with collision
if (place_meeting(x + hsp, y, oCollision)) {
    while (!place_meeting(x + sign(hsp), y, oCollision)) {
        x += sign(hsp);
    }
    hsp = 0;
} else {
    x += hsp;
}

// Handle vertical movement with collision
if (place_meeting(x, y + vsp, oCollision)) {
    while (!place_meeting(x, y + sign(vsp), oCollision)) {
        y += sign(vsp);
    }
    vsp = 0;
} else {
    y += vsp;
}

// Reduce dash cooldown
if (dash_timer > 0) {
    dash_timer--;
}

// Ensure `oPlayer2` updates its position on the server
/*
if (network_is_connected) {
    var packet = buffer_create(256, buffer_fixed, 1);
    buffer_write(packet, buffer_string, "PLAYER2_POSITION");
    buffer_write(packet, buffer_u16, x);
    buffer_write(packet, buffer_u16, y);
    var packet_size = buffer_tell(packet);
    network_send_packet(client_socket, packet, packet_size);
    buffer_delete(packet);
}
*/