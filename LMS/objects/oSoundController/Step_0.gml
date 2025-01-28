if  (!audio_group_is_loaded(Music)) {
	audio_group_load(Music);
}

if (!music_playing) {
	music_playing = true;
	
	show_debug_message(string(room));
	
	if (room == rMainMenu) and (audio_group_is_loaded(Music)) {
		var title = audio_play_sound(sound_title, 1, true, .10);	
		audio_sound_gain(title, 0, 0);
		audio_sound_gain(title, .25, 5000);
	}

	if (room == rPrep0) and (audio_group_is_loaded(Music)) {
		var overworld = audio_play_sound(sound_overworld, 1, true, .10);	
		audio_sound_gain(overworld, 0, 0);
		audio_sound_gain(overworld, .25, 3000);
		
		if (oSaveLoad.stage == stages.FIGHT) and (audio_is_playing(sound_overworld)) {
			var dungeon = audio_play_sound(sound_dungeon, 1, true, .10);	
			audio_sound_gain(dungeon, 0, 0);
			audio_sound_gain(dungeon, .25, 3000);
			audio_sound_gain(sound_title, 0, 1500);
		}
		
		if (oSaveLoad.stage == stages.PREP) and (audio_is_playing(sound_dungeon)) {
			var dungeon = audio_play_sound(sound_overworld, 1, true, .10);	
			audio_sound_gain(dungeon, 0, 0);
			audio_sound_gain(dungeon, .25, 3000);
			audio_sound_gain(sound_dungeon, 0, 1500);
		}
	}
}

if (global.game_state == "Paused") {
	audio_group_set_gain(Music, .025, 0);
} else {
	if (audio_group_get_gain(Music) < .10) {
		audio_group_set_gain(Music, .10, 0);
	}
}