var planter_owner = instance_nearest(x, y, oPlanter);

var nearest_player = instance_nearest(x, y, obj_player);
var distanceFromPlayer = point_distance(nearest_player.x, nearest_player.y, x, y);
var player_device = nearest_player.local_data[$ "input_device"];
var player_rd = nearest_player.local_data[$ "player_order"];

player = nearest_player;

if (planter_owner != noone) {
	var plant_y = planter_owner.y;
	
	if (y > plant_y) {
		depth = -y + 1;
	} else {
		depth = -y - 1;
	}
} else {
	depth = -y;
}

var mx = device_mouse_x(0);
var my = device_mouse_y(0);

hover_timer += hover_speed; // Increment the timer
y_offset = hover_amplitude * sin(hover_timer); // Calculate the vertical offset

switch (seed) {
	case "carrot":
		sprite_index = sCarrotPlant;
		image_speed = .025;
		
		if (image_index >= 5) {
			image_index = 5;
			image_speed = 0;
			ready = true;
		}
	break;
	case "snowPea":
		sprite_index = sSnowPeaPlant;
		image_speed = .040;
		
		if (image_index >= 6) {
			image_index = 6;
			image_speed = 0;
			ready = true;
		}
	break;
	case "sweetPotato":
		sprite_index = sSweetPotatoPlant;
		image_speed = .010;
		
		if (image_index >= 6) {
			image_index = 6;
			image_speed = 0;
			ready = true;
		}
	break;
	case "zucchini":
		sprite_index = sZucchiniPlant;
		image_speed = .015;
		
		if (image_index >= 7) {
			image_index = 7;
			image_speed = 0;
			ready = true;
		}
	break;
	case "nothing":
		sprite_index = noone;
		image_speed = 0;
	break;
}
	
if (player != noone) {
	if (ready == true) and (distanceFromPlayer <= 8) {
		if (mouse_check_button_pressed(mb_left)) or (gamepad_button_check(player_device, gp_face1)) {
			add_item(player, seed, itemData[$ seed], itemData[$ seed][$ "harvest"]);
			planter_owner.state = planter.PENDING;
			planter_owner.alarm[0] = 300;
			instance_destroy(id);
		}
	}
}