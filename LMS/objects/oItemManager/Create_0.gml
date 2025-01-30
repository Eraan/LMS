global.all_items = {
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
		style: "Jab",
		augments: {},
		atk_anim: "sBronzeSwordSwing"
	},
	ironSword : {
		name : "Iron Sword",
		slug : "ironSword",
		price : 35,
		amount : 1,
		sprite : sIronSword,
		object : oIronSword,
		recipe : {
			"ironBar" : 3,
		},
		type : "Weapon",
		damage : 7,
		cooldown : 60,
		style : "Swing",
		augments : {},
		atk_anim : "sIronSwordSwing"
	},
	woodenStick : {
		name: "Wooden Stick",
		slug: "woodenStick",
		price: 15,
		amount: 1,
		sprite: sWoodenStick,
		object: oWoodenStick,
		recipe : {
			"oakLog" : 2,
		},
		type: "Weapon",
		damage: 2,
		cooldown: 60,
		style: "Swing",
		augments: {},
		atk_anim: "sWoodenStickSwing"
	}
}