player_order = (instance_number(obj_player) - 1);
player_character_str = "sPlayer" + string(player_order);
player_avatar_str = "sPlayerAvtr" + string(player_order);
player_avatar = asset_get_index(player_avatar_str);
sprite_index = asset_get_index(player_character_str);
image_speed = 1;

local_data = {
	player_order : player_order,
	player_instance : id,
	player_avtr : player_avatar,
	controlls : "Keyboard",
	input_device : 0,
	wins : 0,
	deaths : 0,
	hp : 20,
	gold : 10,
	strength : 0,
	adrenaline : 1
}

global.player_data[$ player_order] = local_data;

designated_player = noone;

var start_pos = instance_find(oPlayerStart, player_order);
x = start_pos.x;
y = start_pos.y;

enum targetting {
	NULL,
	ENEMY,
	GUI
}

enum move {
	IDLE,
	RUNNING,
	ATTACKING,
	CHOPPING,
	MINING,
	FISHING
}

state = targetting.NULL;
move_state = move.IDLE;
inventory_toggled = false;

// Temp Variables
gold = 10;
attacking = false;
dead = false;

items = {};
weapon = {};