/*function add_oak_logs() {
	if !variable_struct_exists(global.Items, "oakLogs") {
		global.Items.oakLogs = {
			name : "Oak Logs",
			price : 15,
			amount : 1,
			sprite : sOakLogs,
			object : oOakLogs,
			type : "Forestry"
		};
	} else global.Items.oakLogs[$ "amount"] += 1;
}*/

function isStructEmpty(struct) {
	return array_length(variable_struct_get_names(struct)) == 0;
}

// Create an init script
function add_item(player, item_key, item_data, amount) {
	
    if (!struct_exists(player.items, item_key)) {
		//show_debug_message(item_data);
        // If the item doesn't exist, add it with the provided data
		if (item_data[$ "type"] == "Weapon") {
			remove_empty_items(player);
			player.weapon = item_data;
			show_debug_message("WPN | Equipped " + string(item_key));
		} else {
			remove_empty_items(player);
			player.items[$ item_key] = item_data;
			player.items[$ item_key][$ "amount"] = amount;
			show_debug_message("INV | Added New " + string(item_key));
			
		}
		
		//player.items[$ item_key] = item_data;
        
    } else {
		remove_empty_items(player);
        // If the item exists, increment its amount
        player.items[$ item_key][$ "amount"] += amount;
		show_debug_message("INV | Added " + string(item_key));
    }
}