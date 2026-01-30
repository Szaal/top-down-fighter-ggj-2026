/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_player))
{
    var _cam = view_camera[0];
    if (_cam == -1) exit;

    var _cam_w = camera_get_view_width(_cam);
    var _cam_h = camera_get_view_height(_cam);
	
	// Defines the Lean
	var _angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
    var _dist = 16;
	

    // Find the point the direction of the mouse
    var _offset_x = lengthdir_x(_dist, _angle);
    var _offset_y = lengthdir_y(_dist, _angle);

    var _target_x = obj_player.x + _offset_x - (_cam_w / 2);
    var _target_y = obj_player.y + _offset_y - (_cam_h / 2);

    // This prevents the "smearing" void by stopping the camera at room edges
    _target_x = clamp(_target_x, 0, room_width - _cam_w);
    _target_y = clamp(_target_y, 0, room_height - _cam_h);

    var _cur_x = camera_get_view_x(_cam);
    var _cur_y = camera_get_view_y(_cam);
    
    var _spd = 0.1; // Adjust this (0.05 for heavy, 0.2 for snappy)

    var _final_x = lerp(_cur_x, _target_x, _spd);
    var _final_y = lerp(_cur_y, _target_y, _spd);

    camera_set_view_pos(_cam, _final_x, _final_y);
}