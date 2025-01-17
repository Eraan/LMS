image_speed = 0;

enum enemy {
	IDLE,
	MOVING,
	ATTACKING,
	DEAD
}

player = noone;
state = enemy.IDLE;

can_attack = true;
attack_range = 64;
attack_cooldown = 90;
enemy_health = 10;