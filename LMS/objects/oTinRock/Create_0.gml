// Inherit the parent event
event_inherited();
randomize();
time_to_mine = irandom_range(30, SECOND10);

itemData = {
	name: "Tin Ore",
	slug: "tinOre",
	price: 8,
	amount: 1,
	sprite: sTinOre,
	object: oTinOre,
	type: "Mining"
}