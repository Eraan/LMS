player = noone;
player_order = noone;
global.selected_furnace = false;

enum furnace {
	EMPTY,
	PICKING,
	SMELTING,
	PENDING
}

state = furnace.EMPTY;

image_speed = 0;

ready = true;
selection_position = 0;
selected_bar = "";
selected_bar_sprite = noone;

bars = {
	bronzeBar : {
		name: "Bronze Bar",
		slug: "bronzeBar",
		price: 5,
		amount: 2,
		sprite: sBronzeBar,
		object: oBronzeBar,
		recipe : {
			"coal" : 1,
			"tinOre" : 1,
			"copperOre" : 1
		},
		type: "Smithing"
	},
	ironBar : {
		name: "Iron Bar",
		slug: "ironBar",
		price: 1,
		amount: 1,
		sprite: sIronBar,
		object: oIronBar,
		recipe : {
			"coal" : 1,
			"ironOre" : 2,
		},
		type: "Smithing"
	},
	steelBar : {
		name: "Steel Bar",
		slug: "steelBar",
		price: 35,
		amount: 1,
		sprite: sSteelBar,
		object: oSteelBar,
		recipe : {
			"coal" : 2,
			"ironOre" : 4,
		},
		type: "Smithing"
	},
	mithrilBar : {
		name: "Mithril Bar",
		slug: "mithrilBar",
		price: 75,
		amount: 1,
		sprite: sMithrilBar,
		object: oMithrilBar,
		recipe : {
			"coal" : 4,
			"mithrilOre" : 1,
			"steelOre" : 3
		},
		type: "Smithing"
	}
	/*
	bronzeBar : oBronzeBar.itemData,
	ironBar : oIronBar.itemData,
	steelBar : oSteelBar.itemData,
	mithrilBar : oMithrilBar.itemData*/
}