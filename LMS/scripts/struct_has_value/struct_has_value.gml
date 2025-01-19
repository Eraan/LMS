/// @ Check for value inside any struct.
function struct_has_value(struct, struct_length, struct_names, search_value, value) {
	for (var j = 0; j < struct_length; j++) {
		var key = struct_names[j];
		
		if (struct[$ key][$ search_value] != value) {
			return false;	
		} else {
			return true;	
		}
	}
}