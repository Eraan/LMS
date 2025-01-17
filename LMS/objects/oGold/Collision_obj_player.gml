if (other.dead == false) {
	other.local_data[$ "gold"] += amount;
	instance_destroy();
}