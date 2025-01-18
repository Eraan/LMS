// Inherit the parent event
event_inherited();
randomize();
time_to_mine = irandom_range(30, SECOND20);

itemData = {
	name : "Iron Ore",
	slug : "ironOre",
	price : 20,
	amount : 1,
	sprite : sIronOre,
	object : oIronOre,
	type : "Mining"
}