image_speed = .5;
//alarm[1] = 600;

enum enemy {
	IDLE,
	MOVING,
	ATTACKING,
	DUPLICATING,
	DEAD
}

player = noone;
state = enemy.IDLE;

can_attack = true;
attack_range = 64;
attack_cooldown = 90;
enemy_health = 10;