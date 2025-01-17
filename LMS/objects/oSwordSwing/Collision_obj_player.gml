var target = other.id; // Targetted Player
var target_hp = target.local_data.hp; // Targetted Player Health
var target_player = target.local_data[$ "player_number"]; // Targetted Player Number

if (!has_hit) and (target_hp > 0) and (owner != other.id) {
	target.local_data.hp -= owner.weapon[$ "damage"];
	temp_message(other.x, other.y, "-" + string(owner.weapon[$ "damage"]), c_red)
	has_hit = true;
}