// Remove Empty Items or 0 QTY items.
var _eachItem = variable_struct_names_count(global.Items);
var _itemNames = variable_struct_get_names(global.Items);
	
for (var i = 0; i < _eachItem; i++) {
		
	var key = _itemNames[i];
	var value = global.Items[$ key];

	if value[$ "amount"] < 1 {
		delete global.Items[$ key];
		deleteStruct = variable_struct_remove(global.Items, _itemNames[i]);
		show_debug_message(deleteStruct);
	}
}

// New User Info
/*
if global.userStats.new_user != false {
	user = get_string_async("Username",""); 
	//This opens up a message box where the player can type, and then press okay
	global.userStats.new_user = false;
}

// Experience Levels

xpGoal = 3;
forestryXpGoal = global.userLevels.forestry * (experienceRate * global.userLevels.forestry);

if global.userStats.level_xp == xpGoal {
	global.userStats.hp += 1;
	global.userStats.level += 1;
	global.userStats.level_xp = 0;
}

if global.userLevels.forestry_xp >= forestryXpGoal {
	global.userLevels.forestry += 1;
	global.userStats.totalLevels += 1;
}
*/