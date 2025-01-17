// Ensure randomness at the start of the game or room
randomize();

// Parameters
tile_size = 16; // Size of each tile
room_count = 7; // Number of rooms
min_size = 4; // Minimum dimension of a room (in tiles)
max_size = 7; // Maximum dimension of a room (in tiles)

// Arrays to store room positions and dimensions
rooms = [];

// Generate Random Rooms
for (var r = 0; r < room_count; r++) {
    var rm_width = irandom_range(min_size, max_size);
    var rm_height = irandom_range(min_size, max_size);
    var room_x = irandom_range(20, 30); // Adjust range to fit your room
    var room_y = irandom_range(20, 30); // Adjust range to fit your room

    // Store room dimensions
    array_push(rooms, [room_x, room_y, rm_width, rm_height]);

    // Generate all possible floor positions within the room
    var positions = [];
    for (var xx = 0; xx < rm_width; xx++) {
        for (var yy = 0; yy < rm_height; yy++) {
            array_push(positions, [room_x + xx, room_y + yy]);
        }
    }
    //array_shuffle(positions); // Randomize floor placement order

    // Create the room (floors) in a random order
    for (var i = 0; i < array_length(positions); i++) {
        var pos = positions[i];
        instance_create_layer(pos[0] * tile_size, pos[1] * tile_size, "Base", oFloor);
    }
}

// Add Barriers Around Floors
var spawnable_spaces = instance_number(oFloor);
var spawn_random = irandom_range(0, spawnable_spaces);
var spawn_location = instance_find(oFloor, spawn_random);

instance_create_layer(spawn_location.x, spawn_location.y, "Instances", oPlayerStart);

// Connect Rooms with Passages
for (var i = 0; i < array_length(rooms) - 1; i++) {
    var room1 = rooms[i];
    var room2 = rooms[i + 1];

    var x1 = room1[0] + irandom(room1[2] - 1);
    var y1 = room1[1] + irandom(room1[3] - 1);
    var x2 = room2[0] + irandom(room2[2] - 1);
    var y2 = room2[1] + irandom(room2[3] - 1);

    // Create a horizontal passage
    for (var xx = min(x1, x2); xx <= max(x1, x2); xx++) {
        instance_create_layer(xx * tile_size, y1 * tile_size, "Base", oFloor);
    }
    // Create a vertical passage
    for (var yy = min(y1, y2); yy <= max(y1, y2); yy++) {
        instance_create_layer(x2 * tile_size, yy * tile_size, "Base", oFloor);
    }
}

var floor_instances = instance_number(oFloor);
for (var i = 0; i < floor_instances; i++) {
    var floor_inst = instance_find(oFloor, i);
    var fx = floor_inst.x;
    var fy = floor_inst.y;

    // Check all 8 directions (including corners)
    for (var dx = -1; dx <= 1; dx++) {
        for (var dy = -1; dy <= 1; dy++) {
            if (dx == 0 && dy == 0) continue; // Skip the current tile
            var bx = fx + dx * tile_size;
            var by = fy + dy * tile_size;

            // Check if there's already a floor or barrier
            if (!instance_position(bx, by, oFloor) && !instance_position(bx, by, oBarrier)) {
                instance_create_layer(bx, by, "Base", oBarrier);
            }
        }
    }
}