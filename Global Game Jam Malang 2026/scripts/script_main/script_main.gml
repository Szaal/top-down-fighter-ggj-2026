// Write Main Scripts here
function scr_play_sound_rndm_pitch(_sound_id, _priority = 10, _loop = false) {
    var _snd = audio_play_sound(_sound_id, _priority, _loop);
    // Randomize pitch
    audio_sound_pitch(_snd, random_range(0.8, 1.2));
    return _snd;
}

// Helper function for collision against map
function place_meeting_tile(_xoff, _yoff) {
    return
        tilemap_get_at_pixel(collision_tilemap, bbox_left  + _xoff, bbox_top    + _yoff) != 0 ||
        tilemap_get_at_pixel(collision_tilemap, bbox_right + _xoff, bbox_top    + _yoff) != 0 ||
        tilemap_get_at_pixel(collision_tilemap, bbox_left  + _xoff, bbox_bottom + _yoff) != 0 ||
        tilemap_get_at_pixel(collision_tilemap, bbox_right + _xoff, bbox_bottom + _yoff) != 0;
}

