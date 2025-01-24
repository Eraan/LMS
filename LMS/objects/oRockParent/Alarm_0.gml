//stop_chopping(120);
audio_stop_sound(miningSound);
alarm[1] = 120;
image_index = 1;
audio_play_sound(treeFallSound, 10, false, 1, 0.0, 5);
temp_message(x, y, "+ 20 XP", c_white);
add_item(player, itemData[$ "slug"], itemData, 1);
player.state = targetting.NULL;