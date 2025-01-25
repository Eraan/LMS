function split_screen(player_avtr_pos_x, player_avtr_pos_y, player_instance, player_number, player_avatar, player_icon_width, player_items, player_weapon, player_hp, player_wins, player_deaths, player_gold) {
	var scale = 4;
	var count = variable_struct_names_count(global.player_data);
	
	// Player Avatar
	draw_sprite_ext(sPlayerIcon, 0, player_avtr_pos_x, player_avtr_pos_y, scale, scale, 0, c_white, 1);
	draw_sprite_ext(player_avatar, 0, player_avtr_pos_x, player_avtr_pos_y, scale, scale, 0, c_white, 1);
	if (!isStructEmpty(player_weapon)) {
		draw_sprite_ext(player_weapon[$ "sprite"], 0, player_avtr_pos_x + 120, player_avtr_pos_y, scale, scale, 0, c_white, 1);
	}
	
	// Player Stats
	draw_text(player_avtr_pos_x + 72, player_avtr_pos_y, player_number); // PLAYER #
	draw_text_ext(player_avtr_pos_x + 32, player_avtr_pos_y + 64, player_gold, 16, player_icon_width); // GOLD
	draw_text_ext(player_avtr_pos_x + 100, player_avtr_pos_y + 64, player_deaths, 16, player_icon_width); // DEATHS
	draw_text_ext(player_avtr_pos_x + 164, player_avtr_pos_y + 64, player_hp, 16, player_icon_width); // HP
	draw_text_ext(player_avtr_pos_x + 220, player_avtr_pos_y + 64, player_wins, 16, player_icon_width); // WINS
	
	// Player Active Skill
	var number_of_skills = sprite_get_number(sActiveSkill) / 2;
	
	switch (player_instance.move_state) {
		case 0:
			draw_sprite(sActiveSkill, 0 + number_of_skills, player_avtr_pos_x + 256, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 1, player_avtr_pos_x + 256 + 16 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 2, player_avtr_pos_x + 256 + 32 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 3, player_avtr_pos_x + 256 + 48 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 4, player_avtr_pos_x + 256 + 64 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 5, player_avtr_pos_x + 256 + 80 + 2, player_avtr_pos_y + 8);
		break;
		case 1:
			draw_sprite(sActiveSkill, 0, player_avtr_pos_x + 256, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 1 + number_of_skills, player_avtr_pos_x + 256 + 16 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 2, player_avtr_pos_x + 256 + 32 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 3, player_avtr_pos_x + 256 + 48 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 4, player_avtr_pos_x + 256 + 64 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 5, player_avtr_pos_x + 256 + 80 + 2, player_avtr_pos_y + 8);
		break;
		case 2:
			draw_sprite(sActiveSkill, 0, player_avtr_pos_x + 256, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 1, player_avtr_pos_x + 256 + 16 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 2 + number_of_skills, player_avtr_pos_x + 256 + 32 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 3, player_avtr_pos_x + 256 + 48 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 4, player_avtr_pos_x + 256 + 64 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 5, player_avtr_pos_x + 256 + 80 + 2, player_avtr_pos_y + 8);
		break;
		case 3:
			draw_sprite(sActiveSkill, 0, player_avtr_pos_x + 256, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 1, player_avtr_pos_x + 256 + 16 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 2, player_avtr_pos_x + 256 + 32 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 3 + number_of_skills, player_avtr_pos_x + 256 + 48 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 4, player_avtr_pos_x + 256 + 64 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 5, player_avtr_pos_x + 256 + 80 + 2, player_avtr_pos_y + 8);
		break;
		case 4:
			draw_sprite(sActiveSkill, 0, player_avtr_pos_x + 256, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 1, player_avtr_pos_x + 256 + 16 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 2, player_avtr_pos_x + 256 + 32 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 3, player_avtr_pos_x + 256 + 48 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 4 + number_of_skills, player_avtr_pos_x + 256 + 64 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 5, player_avtr_pos_x + 256 + 80 + 2, player_avtr_pos_y + 8);
		break;
		case 5:
			draw_sprite(sActiveSkill, 0, player_avtr_pos_x + 256, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 1, player_avtr_pos_x + 256 + 16 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 2, player_avtr_pos_x + 256 + 32 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 3, player_avtr_pos_x + 256 + 48 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 4, player_avtr_pos_x + 256 + 64 + 2, player_avtr_pos_y + 8);
			draw_sprite(sActiveSkill, 5 + number_of_skills, player_avtr_pos_x + 256 + 80 + 2, player_avtr_pos_y + 8);
		break;
	}
	
	draw_text_ext(player_avtr_pos_x + 32, player_avtr_pos_y + 64, player_gold, 16, player_icon_width); // GOLD
	draw_text_ext(player_avtr_pos_x + 100, player_avtr_pos_y + 64, player_deaths, 16, player_icon_width); // DEATHS
	draw_text_ext(player_avtr_pos_x + 164, player_avtr_pos_y + 64, player_hp, 16, player_icon_width); // HP
	draw_text_ext(player_avtr_pos_x + 220, player_avtr_pos_y + 64, player_wins, 16, player_icon_width); // WINS
		
	// Player Items
	if (!isStructEmpty(player_items)) and (player_instance.inventory_toggled == true) {
		var item_count = variable_struct_names_count(player_items);
		var item_name = variable_struct_get_names(player_items);
			
		for (var j = 0; j < item_count; j++) {
			var key = item_name[j];
			var item_sprite = player_items[$ key][$ "sprite"];
			var item_amount = player_items[$ key][$ "amount"];
				
			// Column 1
			if (j < 4) {
				draw_sprite_ext(item_sprite, 0, player_avtr_pos_x, player_avtr_pos_y + 112 + (j * (18 * scale)), scale, scale, 0, c_white, 1);
				draw_text_transformed_color(player_avtr_pos_x, player_avtr_pos_y + 112 + (j * (18 * scale)), item_amount, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
			}
				
			// Column 2
			if (j > 3) and (j < 8) {
				draw_sprite_ext(item_sprite, 0, player_avtr_pos_x + (18 * scale), player_avtr_pos_y + 112 + ((j - 4) * (18 * scale)), scale, scale, 0, c_white, 1);
				draw_text_transformed_color(player_avtr_pos_x + (18 * scale), player_avtr_pos_y + 112 + ((j - 4) * (18 * scale)), item_amount, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
			}
				
			// Column 4
			if (j > 7) and (j < 12) {
				draw_sprite_ext(item_sprite, 0, player_avtr_pos_x + (18 * scale), player_avtr_pos_y + 112 + ((j - 8) * (18 * scale)), scale, scale, 0, c_white, 1);
				draw_text_transformed_color(player_avtr_pos_x + (18 * scale), player_avtr_pos_y + 112 + ((j - 8) * (18 * scale)), item_amount, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
			}
		}
	}
		
	switch (count) {
		case 2:
			draw_line_color(view_wport[0] / 2, 0, view_wport[0] / 2, view_hport[0], c_black, c_black);
		break;
		case 3:
			draw_line_color(view_wport[0] / 2, 0, view_wport[0] / 2, view_hport[0], c_black, c_black);
			draw_line_color(0, view_hport[0] / 2, view_wport[0], view_hport[0] / 2, c_black, c_black);
			draw_rectangle_color(view_wport[0] / 2, view_hport[0] / 2, view_wport[0], view_hport[0], c_black, c_black, c_black, c_black, false);
		break;
		case 4:
			draw_line_color(view_wport[0] / 2, 0, view_wport[0] / 2, view_hport[0], c_black, c_black);
			draw_line_color(0, view_hport[0] / 2, view_wport[0], view_hport[0] / 2, c_black, c_black);
		break;
	}
}