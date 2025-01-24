if (room == rMainMenu) {
	var snd = audio_play_sound(sound_menu, 1, true, .05);	
	audio_sound_gain(snd, 0, 0);
	audio_sound_gain(snd, .25, 5000);
}

if (room == rPrep0) {
	var snd = audio_play_sound(sound_overworld, 1, true, .05);	
	audio_sound_gain(snd, 0, 0);
	audio_sound_gain(snd, .25, 3000);
}