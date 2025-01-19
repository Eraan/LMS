//window_set_fullscreen(true);
draw_set_font(fPixel);

global.player_data = {};
global.game_rounds = 1;
global.game_state = "Active";

global.res_width = 1440;
global.res_height = 810;

var _ratio = global.res_width / global.res_height;
var _display_ratio = display_get_width() / display_get_height();


if (_display_ratio < _ratio){
    global.res_height = 1920; // Optional

    global.res_width = global.res_height * _display_ratio;
}

window_set_size(global.res_width, global.res_height);
surface_resize(application_surface, global.res_width, global.res_height);

enum stages {
	PENDING,
	init_PREP,
	FIGHT,
	SHOWDOWN,
	PREP
}

stage = stages.PENDING;
leader = noone;
death_count = 0;
enemy_count = 0;