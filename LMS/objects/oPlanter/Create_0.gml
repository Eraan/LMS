player = noone;
player_order = noone;
global.selected_planter = false;

enum planter {
	EMPTY,
	PICKING,
	GROWING,
	PENDING
}

state = planter.EMPTY;

image_speed = 0;

ready = true;
plant_x = x;
plant_y = y;
selection_position = 0;

seeds = {
	carrot : {
		name : "Carrot",
		price : 1,
		sprite : sCarrotSeeds,
		grow_duration : 400
	},
	snowPea : {
		name : "Snow Pea",
		price : 1,
		sprite : sSnowPeaSeeds,
		grow_duration : 350
	},
	sweetPotato : {
		name : "Sweet Potato",
		price : 3,
		sprite : sSweetPotatoSeeds,
		grow_duration : 550
	},
	zucchini : {
		name : "Zucchini",
		price : 2,
		sprite : sZucchiniSeeds,
		grow_duration : 700
	}
}