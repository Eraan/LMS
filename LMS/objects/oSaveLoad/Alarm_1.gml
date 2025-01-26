stage = stages.FIGHT;
alarm[2] = MINUTE1;
alarm[11] = -1;
oGUI.state = screen.ADAPT;

var count = variable_struct_names_count(global.player_data);

for (var i = 0; i < count; i++) {
	var player_instance = global.player_data[$ i][$ "player_instance"];
	
	var arena_spawn = instance_find(oPlayerStart_Arena, i);
	
	if (instance_exists(arena_spawn)) {
		player_instance.x = arena_spawn.x;
		player_instance.y = arena_spawn.y;
		player_instance.dead = false;
		player_instance.local_data.hp = 20;
	}
}