player = noone;
player_order = noone;
global.selected_anvil = false;

enum anvil {
	EMPTY,
	PICKING
}

state = anvil.EMPTY;

image_speed = 0;

ready = true;
selection_position = 0;
selected_bar = "";
selected_bar_sprite = noone;

items = {
	woodenStick : {
		name: "Wooden Stick",
		slug: "woodenStick",
		price: 3,
		amount: 1,
		sprite: sWoodenStick,
		object: oWoodenStick,
		recipe : {
			"oakLog" : 1,
		},
		type: "Weapon",
		damage: 1,
		cooldown: 15,
		atk_anim: sWoodenStickSwing
	},
	bronzeSword : {
		name: "Bronze Sword",
		slug: "bronzeSword",
	    price: 20,
	    amount: 1,
	    sprite: sBronzeSword,
	    object: oBronzeSword,
		recipe : {
			"bronzeBar" : 3,
		},
		type: "Weapon",
		damage: 4,
		cooldown: 30,
		atk_anim: sBronzeSwordSwingRight
	},
	ironSword : {
		name: "Iron Sword",
		slug: "ironSword",
		price: 35,
		amount: 1,
		sprite: sIronSword,
		object: oIronSword,
		recipe : {
			"ironBar" : 3,
		},
		type: "Weapon",
		damage: 7,
		cooldown: 30,
		atk_anim: sIronSwordSwing
	},
	/*
	bronzeBar : oBronzeBar.itemData,
	ironBar : oIronBar.itemData,
	steelBar : oSteelBar.itemData,
	mithrilBar : oMithrilBar.itemData*/
}