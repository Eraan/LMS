dead = false;
local_data.hp = 20;
var start_pos = instance_find(oPlayerStart, player_order);
x = start_pos.x;
y = start_pos.y;
sprite_index = asset_get_index("sPlayer" + string(player_order));