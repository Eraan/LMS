var target = other.id; // Targetted Player
var target_hp = target.local_data.hp; // Targetted Player Health

if (!has_hit) and (target_hp > 0) and (owner != other.id) and (owner != noone) and (speed != 0) {
	has_hit = true;
	target.local_data.hp -= itemData.damage;
	temp_message(other.x, other.y, "-" + string(itemData.damage), c_red);
	instance_destroy();
}