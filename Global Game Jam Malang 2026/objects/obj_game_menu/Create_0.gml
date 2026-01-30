/// @description Initiates The Game

// Set the GUI resolution to a smaller, fixed size
display_set_gui_size(1920, 1080);

// Calls dialogue scripts here.
// Menu Configuration
menu_options = [["START", "SETTINGS", "CREDITS", "EXIT"], ["START", "SETTINGS", "CREDITS", "EXIT"]];
settings = [
"MUSIC: 100%", 
"SOUND: 100%", 
"FULLSCREEN", 
"BACK"];
menu_index = 0;
menu_screen = 0;
menu_total = array_length(menu_options[menu_screen]);
/*
Title = 0
Settings = 1
Credits = 2
*/

// Visual Settings
line_height = 80; // Space between options
menu_y_pos = 0;


// Game settings.
global.game_paused = false;
global.vol_music = 0.7; // 70% volume
global.vol_sfx   = 1.0; // 100% volume

audio_group_load(ag_music);
audio_group_load(ag_sfx);

// Scatter Animation 
scatter_speed = 0.5; 
timer = 0;
offset = 0;

// Fade Animation
fade = 1;