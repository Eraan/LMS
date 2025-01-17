var target = other.id; // Targetted Enemy
var target_hp = target.enemy_health; // Targetted Enemy Health

if (!has_hit) and (target_hp > 0) and (owner != other.id) and (owner != noone) and (speed != 0)  {
	if (object_get_name(owner.object_index) != "oEnemy") {
		target_hp -= itemData.damage;
		temp_message(other.x, other.y, "-" + string(itemData.damage), c_red);
		has_hit = true;
	}
}