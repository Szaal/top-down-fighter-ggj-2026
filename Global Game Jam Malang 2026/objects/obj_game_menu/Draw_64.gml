var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

draw_set_font(fnt_subtitle);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Menu Options
for (var _i = 0; _i < menu_total; _i++) {
    var _y = menu_y_pos + (_i * line_height);
    var _text = menu_options[menu_screen][_i];
	var _color = c_white;
	if (_i == 1)
	{
		_color = c_gray;
	}
    
    if (_i == menu_index && !(_i == 1)) {
        _color = c_yellow;
    }
    
    draw_text_color(_gui_w / 2, _y + 180, menu_options[menu_screen][_i], _color, _color, _color, _color, fade);
}

