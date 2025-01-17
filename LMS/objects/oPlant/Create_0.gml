player = noone;
seed = "nothing";
ready = false;
amount = 1;
depth = -y;
image_speed = 0;

list = [];

sprite_index = sCarrotPlant;
plant_index = irandom_range(6, 7);
hover_amplitude = 1.5; // How far the sprite moves up and down
hover_speed = 0.05;  // Speed of the hovering motion
hover_timer = 0;     // Timer to track the sine wave
y_offset = 0;

itemData = {
	carrot : {
	    name: "Carrot",
		slug: "carrot",
	    price: 1,
	    amount: 1,
	    sprite: sCarrot,
	    object: oCarrot,
	    type: "Farming",
		harvest: irandom_range(3, 5)
	},
	snowPea : {
	    name: "Snow Pea",
		slug: "snowPea",
	    price: 2,
	    amount: 1,
	    sprite: sSnowPea,
	    object: oSnowPea,
	    type: "Farming",
		harvest: irandom_range(6, 9)
	},
	sweetPotato : {
	    name: "Sweet Potato",
		slug: "sweetPotato",
	    price: 2,
	    amount: 1,
	    sprite: sSweetPotato,
	    object: oSweetPotato,
	    type: "Farming",
		harvest: irandom_range(2, 3)
	},
	zucchini : {
	    name: "Zucchini",
		slug: "zucchini",
	    price: 2,
	    amount: 1,
	    sprite: sZucchini,
	    object: oZucchini,
	    type: "Farming",
		harvest: irandom_range(2, 4)
	}
};