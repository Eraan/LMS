if (room == rLobby) {
	if (audio_is_playing(sound_menu)) {
		audio_sound_gain(sound_menu, 0, 1500);
	}
}

music_playing = false;