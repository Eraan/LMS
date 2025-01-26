if  (!audio_group_is_loaded(Music)) {
	audio_group_load(Music);
}

if (!music_playing) {
	music_playing = true;
	
	show_debug_message(string(room));
	
	if (room == rMainMenu) and (audio_group_is_loaded(Music)) {
		var snd = audio_play_sound(sound_menu, 1, true, .10);	
		audio_sound_gain(snd, 0, 0);
		audio_sound_gain(snd, .25, 5000);
	}

	if (room == rPrep0) and (audio_group_is_loaded(Music)) {
		var snd = audio_play_sound(sound_overworld, 1, true, .10);	
		audio_sound_gain(snd, 0, 0);
		audio_sound_gain(snd, .25, 3000);
	}
}

if (global.game_state == "Paused") {
	audio_group_set_gain(Music, .025, 0);
} else {
	if (audio_group_get_gain(Music) < .10) {
		audio_group_set_gain(Music, .10, 0);
	}
}