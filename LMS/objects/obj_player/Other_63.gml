//This event runs when a message box is closed (either pressing okay or closing it (clicking the x in top right on windows)
var i_d = ds_map_find_value(async_load, "id"); // The id of the message box
if i_d != user exit //Check which message box is being closed, if it's not the one assigned to this object exit.
var result = ds_map_find_value(async_load, "result"); // Set the name variable to whatever the player typed.
local_data.player_name = string(result);
global.player_data[$ player_order][$ "player_name"] = string(result);
//show_debug_message(string(result));