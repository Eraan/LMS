if (!has_hit and other.dead == false) {
    other.dummy_health -= owner.weapon[$ "damage"];
	temp_message(other.x, other.y, "-" + string(owner.weapon[$ "damage"]), c_red)
    has_hit = true;
}