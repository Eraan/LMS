player_order = (instance_number(obj_player) - 1);
player_character_str = "sPlayer" + string(player_order);
player_avatar_str = "sPlayerAvtr" + string(player_order);
player_avatar = asset_get_index(player_avatar_str);
last_direction = "Down";
idle_timer = undefined;
idle_action = irandom_range(0, 3);
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
	gold : 100,
	strength : 0,
	adrenaline : 1
}

/*
var numPads = gamepad_get_device_count();

if (oSaveLoad.stage == stages.PENDING) and (player_order == 0) {
	for (var i = 0; i < numPads; i++) {
	    if (gamepad_is_connected(i)) {
	        if (gamepad_button_check_pressed(i, gp_start)) {
				local_data.controls = "Gamepad";
				local_data.input_device = i;
			}
	    }
	}
}*/

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
weapon = {
    name: "Wooden Stick",
	slug: "woodenStick",
    price: 3,
    amount: 1,
    sprite: sWoodenStick,
    object: oWoodenStick,
    type: "Weapon",
	damage: 10,
	cooldown: 15,
	atk_anim: sWoodenStickSwing
};