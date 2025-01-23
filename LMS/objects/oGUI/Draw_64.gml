if (oSaveLoad.ready_start == true) {
	draw_set_font(font_announcement);
	draw_set_halign(fa_center);
	draw_text(view_wport[0] / 2, view_hport[0] / 2 - 16, "press start to begin game");
	draw_set_halign(fa_left);
	draw_set_font(fPixel);
}

if (instance_exists(obj_player)) {

	//draw_text_ext_transformed(0, 0, global.player_data, 16, 500, 1, 1, 0);

	// Iterate Over Players
	//var count = array_length(global.player_count);

	var count = variable_struct_names_count(global.player_data);

	for (var i = 0; i < count; i++) {
		var scale = 4;
		var player_icon_width =  view_wport[0] / count;
		var player_instance = global.player_data[$ i][$ "player_instance"];
		var player_order = global.player_data[$ i][$ "player_order"];
		var player_avatar = global.player_data[$ i][$ "player_avtr"];
		var player_hp = global.player_data[$ i][$ "hp"];
		var player_gold = global.player_data[$ i][$ "gold"];
		var player_wins = global.player_data[$ i][$ "wins"];
		var player_deaths = global.player_data[$ i][$ "deaths"];
	
		var player_items = player_instance.items;
		var player_weapon = player_instance.weapon;
		var player_number = "null";
		var unresolved_gap = 0;
	
		// Player Number Identifier (temp)
		switch (player_order) {
			case 0:
				player_number = "Bunny";
			break;
			case 1:
				player_number = "Kitty";
			break;
			case 2:
				player_number = "Coonie";
			break;
			case 3:
				player_number = "Bully";
			break;
		}
	
		if (i == 0) {
			unresolved_gap = 0;
		} else {
			unresolved_gap = 2;
		}
	
		// Player Info Spaceholder
		//draw_rectangle_color((i * player_icon_width) + (unresolved_gap), view_hport[0] - 64, (player_icon_width * (1 + i)), view_hport[0], c_black, c_aqua, c_black, c_aqua, true);
	
		if (state == screen.ADAPT) { // Pretty much everyone shares the screen...
			// Player Avatar
			draw_sprite_ext(sPlayerIcon, 0, player_icon_width * i + 64, view_hport[0] - 128, scale, scale, 0, c_white, 1);
			draw_sprite_ext(player_avatar, 0, player_icon_width * i + 64, view_hport[0] - 128, scale, scale, 0, c_white, 1);
			if (!isStructEmpty(player_weapon)) {
				draw_sprite_ext(player_weapon[$ "sprite"], 0, player_icon_width * i + 64 + 120, view_hport[0] - 128, scale, scale, 0, c_white, 1);
			}
	
			// Player Stats
			draw_text(player_icon_width * i + 64 + 72, view_hport[0] - 128, player_number); // PLAYER #
			draw_text_ext(player_icon_width * i + 64 + 220, view_hport[0] - 64, player_wins, 16, player_icon_width); // WINS
			draw_text_ext(player_icon_width * i + 64 + 164, view_hport[0] - 64, player_hp, 16, player_icon_width); // HP
			draw_text_ext(player_icon_width * i + 64 + 100, view_hport[0] - 64, player_deaths, 16, player_icon_width); // DEATHS
			draw_text_ext(player_icon_width * i + 64 + 32, view_hport[0] - 64, player_gold, 16, player_icon_width); // GOLD
		} else if (state == screen.SPLIT) { 
			var player_avtr_pos_x = (view_xport[i] / 2 + 8);
			var player_avtr_pos_y = (view_yport[i] / 2 + 8);
		
			split_screen(player_avtr_pos_x, player_avtr_pos_y, player_instance, player_number, player_avatar, player_icon_width, player_items, player_weapon, player_hp, player_wins, player_deaths, player_gold);
		}
	}
}

draw_set_font(font_announcement);
draw_set_halign(fa_center);

switch (oSaveLoad.stage) {
	case stages.PENDING:
		var count = variable_struct_names_count(global.player_data);

		for (var i = 0; i < 4; i++) {
			if (count >= (i + 1)) {
				draw_sprite_ext(sPlayerSlot, (i + 2), 16 + (64 * i), 24, 4, 4, 0, c_white, 1);
			} else {
				draw_sprite_ext(sPlayerSlot, 0, 16 + (64 * i), 24, 4, 4, 0, c_white, 1);	
			}
		}
		
		if (oSaveLoad.alarm[0] != "-1") {
			draw_text_ext_transformed(view_wport[0] / 2, view_hport[0] / 2 - 16, round(oSaveLoad.alarm[0] / 60), 32, 500, 1, 1, 0);
		} else {
			draw_set_font(fPixel);
			draw_text(view_wport[0] / 2, 48, "press A to join");
			draw_set_font(font_announcement);
		}
	break;
	
	case stages.init_PREP:
		//draw_text(view_wport[0] / 2, view_hport[0] / 2 - 16, "PREPARE");
		draw_text(view_wport[0] / 2, view_hport[0] / 2 - 32, "ROUND " + string(global.game_rounds));
		draw_text_ext_transformed(view_wport[0] / 2, view_hport[0] / 2, string(floor(oSaveLoad.alarm[1] / 3600)) + ":" + string(floor((oSaveLoad.alarm[1] / 60) mod 60)), 32, 500, 1, 1, 0);
	break;
	case stages.FIGHT:
		//draw_text(view_wport[0] / 2, 0, "FIGHT");
		draw_text(view_wport[0] / 2, 32, "ROUND " + string(global.game_rounds));
		draw_text_ext_transformed(view_wport[0] / 2, 64, string(floor(oSaveLoad.alarm[2] / 3600)) + ":" + string(floor((oSaveLoad.alarm[2] / 60) mod 60)), 32, 500, 1, 1, 0);
	break;
	case stages.SHOWDOWN:
		//draw_text(view_wport[0] / 2, 0, "SHOWDOWN");
		draw_text(view_wport[0] / 2, 32, "ROUND " + string(global.game_rounds));
		draw_text_ext_transformed(view_wport[0] / 2, 64, string(floor(oSaveLoad.alarm[3] / 3600)) + ":" + string(floor((oSaveLoad.alarm[3] / 60) mod 60)), 32, 500, 1, 1, 0);
	break;
	case stages.PREP:
		//draw_text(view_wport[0] / 2, view_hport[0] / 2, "PREPARE");
		draw_text(view_wport[0] / 2, view_hport[0] / 2 - 32, "ROUND " + string(global.game_rounds));
		draw_text_ext_transformed(view_wport[0] / 2, view_hport[0] / 2, string(floor(oSaveLoad.alarm[1] / 3600)) + ":" + string(floor((oSaveLoad.alarm[1] / 60) mod 60)), 32, 500, 1, 1, 0);
	break;
}

draw_set_font(fPixel);

if (global.game_state == "Paused") {
	game_paused_gui();
}
draw_set_halign(fa_left);