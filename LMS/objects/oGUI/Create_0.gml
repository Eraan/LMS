/// Manage Most GUI for the game... split screen, player stats, etc.
enum screen {
	SOLO,
	SPLIT,
	ADAPT
}

state = screen.SOLO;
pause_button = "Play";


font_announcement = font_add_sprite_ext(sAnnouncementFont, "!#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ|\]^_` abcdefghijklmnopqrstuvwxyz", true, 0);