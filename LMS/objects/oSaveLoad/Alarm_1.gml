stage = stages.FIGHT;
alarm[2] = MINUTE2;
alarm[11] = -1;
oGUI.state = screen.ADAPT;

var count = variable_struct_names_count(global.player_data);

for (var i = 0; i < count; i++) {
	var player_instance = global.player_data[$ i][$ "player_instance"];
	
	if (instance_exists(oArena)) {
		player_instance.x = oArena.x;
		player_instance.y = oArena.x;
	}
}