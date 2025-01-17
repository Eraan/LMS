client_socket = network_create_socket(network_socket_tcp);
if (client_socket < 0) {
    show_debug_message("Failed to create client socket.");
} else {
    show_debug_message("Client socket created.");
}
network_connect(client_socket, "127.0.0.1", 7100);

buffer_message = "";

inventory = ds_list_create();
currentPlayer = true;

global.userStats.user_id = id;
global.playerHealth = 2;

image_speed = 0;

// Movement variables
move_speed = 2.5;          // Base speed
acceleration = 0.5;      // Acceleration rate
fric = 0.3;          // Deceleration when not pressing movement keys
hsp = 0;                 // Horizontal speed
vsp = 0;                 // Vertical speed

// Dash variables
dash_speed = 8;          // Speed multiplier during dash
dash_duration = 10;      // How long the dash lasts (frames)
dash_cooldown = 50;      // Time before another dash can occur (frames)
dash_timer = 0;          // Tracks dash duration and cooldown
is_dashing = false;      // Whether the player is currently dashing
dash_direction_x = 0;    // Stores dash direction X
dash_direction_y = 0;    // Stores dash direction Y

// Sword swing variables
swinging = false;          // Is the player swinging the sword?