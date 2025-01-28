if (room == rLobby) {
	if (audio_is_playing(sound_title)) {
		audio_sound_gain(sound_title, 0, 1500);
	}
}

music_playing = false;