player = noone;
player_order = noone;

enum ironOre {
	IDLE,
	MINING,
	DEAD,
}

state = ironOre.IDLE;

image_speed = 0;
ready = true;
player = 0;
randomize();
time_to_mine = irandom_range(30, SECOND10);
itemData = noone;

itemData = {
	name: "Iron Ore",
	slug: "ironOre",
	price: 10,
	amount: 1,
	sprite: sIronOre,
	object: oIronOre,
	type: "Mining"
}