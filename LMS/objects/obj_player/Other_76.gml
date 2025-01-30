if (event_data[? "event_type"] == "sprite event") and (room == rPrep0) {
    switch (event_data[? "message"]) {
        case "Step1":
            audio_play_sound(sound_step1, 10, false, .025);
        break;

        case "Step2":
            audio_play_sound(sound_step2, 10, false, .025);
        break;
    }
}