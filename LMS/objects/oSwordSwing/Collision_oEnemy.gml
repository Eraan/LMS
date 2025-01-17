var target = other.id; // Targetted Enemy
var target_hp = target.enemy_health; // Targetted Enemy Health

if (!has_hit) and (target_hp > 0) and (owner != other.id) {
	target.enemy_health -= owner.weapon[$ "damage"];
	temp_message(other.x, other.y, "-" + string(owner.weapon[$ "damage"]), c_red)
	has_hit = true;
}