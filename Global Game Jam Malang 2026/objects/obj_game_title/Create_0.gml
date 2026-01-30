/// @description Initiates The Game

// Set the GUI resolution to a smaller, fixed size
display_set_gui_size(1920, 1080);

// Calls dialogue scripts here.
// Menu Configuration
menu_title = ["TITLE", "SETTINGS", "CREDITS"];
title_index = 0;
menu_screen = 0;
/*
Title = 0
Settings = 1
Credits = 2
*/


// Visual Settings
line_height = 80; // Space between options
title_y_pos = display_get_gui_height() * 0.35;
title_move = 0;

// Game settings.
global.game_paused = false;
global.vol_music = 0.7; // 70% volume
global.vol_sfx   = 1.0; // 100% volume

audio_group_load(ag_music);
audio_group_load(ag_sfx);

// Bobbing Animation

bob_range = 10; 
bob_speed = 0.05; 
timer = 0;
offset = 0;

// Fade Animation
fade = 1;