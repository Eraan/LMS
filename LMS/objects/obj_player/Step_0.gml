depth = -y;

if (global.game_state == "Paused") {
	exit;	
}

var mx = device_mouse_x(0);
var my = device_mouse_y(0);

if (local_data.hp != global.player_data[$ player_order][$ "hp"]) {
	global.player_data[$ player_order][$ "hp"] = local_data.hp;
}

if (local_data.gold != global.player_data[$ player_order][$ "gold"]) {
	global.player_data[$ player_order][$ "gold"] = local_data.gold;
}

if (local_data.wins != global.player_data[$ player_order][$ "wins"]) {
	global.player_data[$ player_order][$ "wins"] = local_data.wins;
}

if (local_data.deaths != global.player_data[$ player_order][$ "deaths"]) {
	global.player_data[$ player_order][$ "deaths"] = local_data.deaths;
}

var player_count = variable_struct_names_count(global.player_data);

if (oSaveLoad.stage != stages.PENDING) {
	for (var i = 0; i < player_count; i++) {
		var controlls = global.player_data[$ i][$ "controlls"];
		var device = global.player_data[$ i][$ "input_device"];
		var player_instance = global.player_data[$ i][$ "player_instance"];
		var player_ordr = global.player_data[$ i][$ "player_order"];
		var player_adrenaline = global.player_data[$ i][$ "adrenaline"] / player_count;

		if (global.player_data[$ i][$ "hp"] <= 0) and (player_instance.dead == false) {
			
			if (oSaveLoad.stage == stages.PREP) {
				player_instance.alarm[1] = 120;
			} else {
				oSaveLoad.death_count += 1;
			}
			
			player_instance.sprite_index = asset_get_index("sPlayerDead" + string(player_order));
			player_instance.dead = true;
			global.player_data[$ i][$ "deaths"] += 1;
			var gold_drop = instance_create_layer(x, y, "Instances", oGold) 
			with (gold_drop) {
				amount = 15;
			}
		}
		
		// Player Controlls
		if (controlls == "Keyboard") {
			keyboard_controls(player_instance, player_ordr, device, player_adrenaline);
		} else if (controlls == "Gamepad") {
			gamepad_controls(player_instance, player_ordr, device, player_adrenaline);
		}
		
		// Remove Items from Inventory with a 0 amount.
		//remove_empty_items(player_instance);
	}
}

//if (player_order == 0) { player_movement(mx, my); }

