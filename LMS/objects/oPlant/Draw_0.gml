draw_self();

var nearest_player = instance_nearest(x, y, obj_player);
var distanceFromPlayer = point_distance(nearest_player.x, nearest_player.y, x, y);
var player_device = nearest_player.local_data[$ "input_device"];
var player_rd = nearest_player.local_data[$ "player_order"];

if (player != noone) {
	if (ready == true) and (distanceFromPlayer <= 8) {
		
		draw_rectangle(x, y, x + 15, y + 15, true);
		draw_sprite_ext(sHoe, 0, x + 16, y + 3, .35, .35, 0, c_black, .5);
		draw_sprite_ext(sHoe, 0, x + 16, y + y_offset, .5, .5, 0, c_white, 1);
	}
}