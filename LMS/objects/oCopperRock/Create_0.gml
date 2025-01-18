// Inherit the parent event
event_inherited();
randomize();
time_to_mine = irandom_range(30, SECOND10);

itemData = {
	name: "Copper Ore",
	slug: "copperOre",
	price: 9,
	amount: 1,
	sprite: sCopperOre,
	object: oCopperOre,
	type: "Mining"
}