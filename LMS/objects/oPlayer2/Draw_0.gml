draw_self();


// Get the direction of the mouse relative to the player's position
var mouse_direction = point_direction(x + 8, y + 8, mouse_x, mouse_y);
draw_line(x + 7, y + 8, mouse_x, mouse_y);

draw_text_ext_transformed_color(x + 1, y - 6, global.userStats.username, 1, 500, .25, .25, 0, c_white, c_white, c_white, c_white, .80);