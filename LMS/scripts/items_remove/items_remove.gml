function remove_empty_items(player_instance) {
	if (!isStructEmpty(player_instance.items)) {
		var item_count = struct_names_count(player_instance.items);
		var item_name = struct_get_names(player_instance.items);
			
		for (var j = 0; j < item_count; j++) {
			var key = item_name[j];
			var item_amount = player_instance.items[$ key][$ "amount"];
				
			if (item_amount <= 0) {
				struct_remove(player_instance.items, key);
				show_debug_message("INV | Removed " + string(key));
			}
		}
	}
}