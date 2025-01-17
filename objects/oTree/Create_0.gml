player = noone;
player_order = noone;

enum tree {
	IDLE,
	CHOPPING,
	DEAD,
}

state = tree.IDLE;

image_speed = 0;
ready = true;
player = 0;
randomize();
chooseTimeToChop = irandom_range(30, SECOND10);
chooseSprite = irandom_range(1, 3);
chooseTree = 1; //irandom_range(1, 3);
itemData = noone;

switch (chooseTree) {
	case 1:
		itemData = {
		    name: "Oak Log",
			slug: "oakLog",
		    price: 15,
		    amount: 1,
		    sprite: sOakLog,
			parent_s: sOak1,
		    object: oOakLog,
		    type: "Forestry"
		}
	break;
	case 2:
		itemData = {
		    name: "Pine Log",
			slug: "pineLog",
		    price: 15,
		    amount: 1,
		    sprite: sPineLog,
			parent_s: sPine1,
		    object: oPineLog,
		    type: "Forestry"
		}
	break;
	case 3:
		itemData = {
			name: "Spruce Log",
			slug: "spruceLog",
			price: 15,
			amount: 1,
			sprite: sSpruceLog,
			parent_s: sSpruce1,
			object: oSpruceLog,
			type: "Forestry"
		}
	break;
}

