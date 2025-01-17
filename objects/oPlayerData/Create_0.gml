///@description ALL DATA IS STORED HERE
inventoryToggled = false;
levelsToggled = false;
experienceRate = 125;

global.state = "GUI";

// User Stats
global.userStats = 
{
	user_id : 0,
	new_user : true,
	username : "noone",
	position_x : 0,
	position_y : 0,
	level : 1,
	level_xp : 0,
	hp : 10,
	bonus_hp : 0,
	gold : 100,
	weapon : noone
}

// User Levels
global.userLevels = 
{
	forestry : 1,
	forestry_xp : 0
}

// Item Data
global.Items = {};