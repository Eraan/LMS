stop_chopping(640);
audio_play_sound(treeFallSound, 10, false, 1, 0.0, 5);
//temp_message(x, y, "+ 20 XP", c_white);
add_item(player, itemData[$ "slug"], itemData, 1);
image_index = 1;
state = tree.DEAD;
player.move_state = move.IDLE;
player.state = targetting.NULL;