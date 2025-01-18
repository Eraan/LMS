enum mining_state {
	IDLE,
	MINING,
	DEAD,
}

image_speed = 0;

state = mining_state.IDLE;
player = noone;
player_order = noone;
time_to_mine = 0;
ready = true;
itemData = {};