image_speed = 0;
player = noone;

enum pillar {
	IDLE,
	ELEVATING,
	ERECT,
	COLLAPSING
}

state = pillar.IDLE;