if (global.full_screen) {
	// Enable borderless fullscreen
	window_enable_borderless_fullscreen(true);

	// Set the window to fullscreen
	window_set_fullscreen(true);
}

audio_play_sound(snd_zen_pathways, 1, true);