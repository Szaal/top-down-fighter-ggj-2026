// Menu Navigation

// Menu Size
menu_total = array_length(menu_options[menu_screen]);
if (instance_exists(obj_game_title)) {
	menu_y_pos = obj_game_title.title_y_pos;
}

// --- Keys ---
var _key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("W"));
var _key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("S"));

var _key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var _key_cancel = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (_key_up) {
    menu_index = (menu_index - 1 + menu_total) % menu_total;
	if (menu_index = 1)
	{
		menu_index = 0;
	}
    audio_play_sound(snd_menu_move, 0, 0);
}
if (_key_down) {
    menu_index = (menu_index + 1) % menu_total;
	if (menu_index = 1)
	{
		menu_index = 2;
	}
    audio_play_sound(snd_menu_move, 0, 0);
}

// 4. Action Execution
if (_key_select) {
    switch(menu_index) {
        case 0: 
			/* Start game */ 
			room_goto(rm_intro); 
			break;
        case 1: 
			/* Go to settings */ 
			scr_title_animation();
			switch(menu_screen) {
				case 0:
					menu_screen = 1;
					break;
				case 1:
				
					break;
				
			}
			break;
        case 2: 
			/* Go to credits */ break;
        case 3: 
			game_end(); break;
    }
}

if (keyboard_check_pressed(vk_f4)) {
	window_set_fullscreen(!window_get_fullscreen());
}

