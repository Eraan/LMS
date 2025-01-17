/// @description Add an item to master list
/// @param Attributes The array of attributes to add
function AddItemToMasterList(attributes) {
	
	// Does the global variable exist?
	if (variable_global_exists("AllItems") == false) {
		//global.AllItems = ds_grid_create(0, Item.Height);
		show_message("No Varaible called AllItems");
		return;
	}
	// Is the global variable a ds grid?
	if (ds_exists(global.AllItems, ds_type_grid) == false) {
		//global.AllItems = ds_grid_create(0, Item.Height);	
		show_message("No DS Grid Found.");
		return;
	}
	
	// Are the attributes proper?
	if (is_array(attributes) == false || array_length(attributes) != Item.Height) {
		show_message("Items Ain't Right.");
		return;	
	}
	
	// Add the item
	ds_grid_resize(global.AllItems, ds_grid_width(global.AllItems) + 1, ds_grid_height(global.AllItems));
	for (var i = 0; i < array_length(attributes); ++ i) {
		global.AllItems[# ds_grid_width(global.AllItems) - 1, i] = attributes[i];
	}
}