// Menu Navigation

if (instance_exists(obj_game_menu)) {
    title_index = obj_game_menu.menu_index;
}

// Animations
if (title_move = 0) {
	timer += bob_speed;
	offset = sin(timer) * bob_range;
}
