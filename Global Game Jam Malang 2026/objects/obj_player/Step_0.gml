/// @description Insert description here

// --- Keys ---
var _key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var _key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));

var _key_select = keyboard_check(vk_enter) || keyboard_check(ord("Z"));
var _key_cancel = keyboard_check(vk_shift) || keyboard_check(ord("X"));

// Gets horizontal and vertical movement inputs.
var _hor = _key_right - _key_left; // Horizontal.
var _ver = _key_up - _key_down; // Vertical.

// --- Sprinting logic ---
if (keyboard_check(vk_shift))
{
	is_sprint = 1.675;
}
else
{
	is_sprint = 1;
}

var _direction = darctan2(_ver, _hor); // Calculates the direction of the input vector.

hsp = 0; vsp = 0;

if (global.game_paused)
{
	_hor = 0;
	_ver = 0;
}
var _is_moving = (_hor != 0 || _ver != 0);

/// === MOVEMENT CHECKER ===
// Checks whenever the Player moves.
if (_is_moving)
{
	// Normalizes diagonal movement calculation.
	hsp = lengthdir_x((player_speed + 0.2) * is_sprint, _direction);
	vsp = lengthdir_y((player_speed + 0.2) * is_sprint, _direction);
}
x += hsp; 
y += vsp; 

// Get the angle in (x, y) to the mouse (mouse_x, mouse_y)
var _target_angle = point_direction(x, y, mouse_x, mouse_y);

// Smoothly rotate toward the target angle (0.1 is the speed)
image_angle += angle_difference(_target_angle, image_angle) * rotate_speed;


