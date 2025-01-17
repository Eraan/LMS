/*
function save_game() {
	global.settings.position_x = oPlayer.x;
	global.settings.position_y = oPlayer.y;
	global.userStats.user_id = instance_find(oPlayer, 0);
	
	var _saveArray = array_create(0);
	
	//set and save stats	
	array_push(_saveArray, global.settings);
	array_push(_saveArray, global.userStats);
	array_push(_saveArray, global.userLevels);
	array_push(_saveArray, global.Items);
	
	//Actual Saving
	var _filename = "savedata.json";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create( string_byte_length(_json) + 1, buffer_fixed, 1 );
	buffer_write( _buffer, buffer_string, _json);
	
	buffer_save( _buffer, _filename );
	
	buffer_delete(_buffer);

}

function load_game() {
	
	//loading our saved data
		var _filename = "savedata.json"
		if !file_exists(_filename) {
			exit;
		}
		
	//load buffer, get json
		var _buffer = buffer_load(_filename);
		var _json = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		var _loadArray = json_parse(_json);
		
	//set the data
		global.settings = array_get(_loadArray, 0);
		global.userStats = array_get(_loadArray, 1);
		global.userLevels = array_get(_loadArray, 2);
		global.Items = array_get(_loadArray, 3);
		
	// Reposition Player
		oPlayer.x = global.settings.position_x;
		oPlayer.y = global.settings.position_y;
		
	// New User
		global.userStats.new_user = false;
		
	
}
*/