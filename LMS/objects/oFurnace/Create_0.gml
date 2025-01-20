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

smoke_timer = 0;

bars = {
	bronzeBar : {
		name : "Bronze Bar",
		slug : "bronzeBar",
		price : 5,
		amount : 2,
		sprite : sBronzeBar,
		object : oBronzeBar,
		cooldown : 420,
		recipe : {
			"coal" : 1,
			"tinOre" : 1,
			"copperOre" : 1
		},
		type : "Smithing"
	},
	ironBar : {
		name : "Iron Bar",
		slug : "ironBar",
		price : 20,
		amount : 1,
		sprite : sIronBar,
		object : oIronBar,
		cooldown : SECOND10,
		recipe : {
			"coal" : 1,
			"ironOre" : 2,
		},
		type : "Smithing"
	},
	steelBar : {
		name: "Steel Bar",
		slug: "steelBar",
		price: 35,
		amount: 1,
		sprite: sSteelBar,
		object: oSteelBar,
		cooldown : SECOND20,
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
		cooldown : SECOND30,
		recipe : {
			"coal" : 4,
			"mithrilOre" : 2,
			"steelOre" : 1
		},
		type: "Smithing"
	},
	coal : {
		name: "Coal",
		slug: "coal",
		price: 5,
		amount: 1,
		sprite: sCoal,
		object: oCoal,
		cooldown : SECOND10,
		recipe : {
			"oakLog" : 1,
		},
		type: "Smithing"
	}
	/*
	bronzeBar : oBronzeBar.itemData,
	ironBar : oIronBar.itemData,
	steelBar : oSteelBar.itemData,
	mithrilBar : oMithrilBar.itemData*/
}