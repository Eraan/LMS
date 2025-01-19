if (room == rLobby) || (room == rMainMenu) {
	exit;	
}

var count = variable_struct_names_count(global.player_data);

for (var i = 0; i < count; i++) {
	var player_instance = global.player_data[$ i][$ "player_instance"];
	
	// Last Man Standing Achievement
	if (global.player_data[$ i][$ "wins"] >= 1) and (global.achievements.last_man_standing[$ "unlocked"] == false) {
		global.achievements.last_man_standing[$ "unlocked"] = true;
		temp_message(player_instance.x, player_instance.y, "Last Man Standing Unlocked!", c_orange);
	}
	
	// New Smith Achievement
	if (player_instance.weapon[$ "slug"] == "ironSword") and (global.achievements.new_smith[$ "unlocked"] == false) {
		global.achievements.new_smith[$ "unlocked"] = true;
		temp_message(player_instance.x, player_instance.y, "New Smith Unlocked!", c_orange);
	}
	
	// Master Smith Achievement
	if (player_instance.weapon[$ "slug"] == "mithrilSword") and (global.achievements.master_smith[$ "unlocked"] == false) {
		global.achievements.master_smith[$ "unlocked"] = true;
		temp_message(player_instance.x, player_instance.y, "Master Smith Unlocked!", c_orange);
	}
}