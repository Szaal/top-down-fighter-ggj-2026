var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _color = c_white;
var _color_shadow = c_dkgrey


// Main Title
draw_text_color(_gui_w / 2, title_y_pos + 4 + offset, menu_title[menu_screen], _color_shadow, _color_shadow, _color_shadow, _color_shadow, fade);

// Shadow
draw_text_color(_gui_w / 2 + 4, title_y_pos + offset, menu_title[menu_screen], _color, _color, _color, _color, fade);