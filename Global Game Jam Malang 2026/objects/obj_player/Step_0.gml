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
<<<<<<< Updated upstream
	is_sprint = 1.675;
}
else
{
	is_sprint = 1;
=======
    case "MOVE":
        var _is_moving = (_hor != 0 || _ver != 0);

		target_angle = point_direction(x, y, mouse_x, mouse_y);
		image_angle += angle_difference(target_angle, image_angle) * rotate_speed;
		
        if (_is_moving) 
        {
            var _direction = point_direction(0, 0, _hor, _ver);
            hsp = lengthdir_x(player_speed, _direction);
            vsp = lengthdir_y(player_speed, _direction);
        } 
        else 
        {
            hsp = 0;
            vsp = 0;
        }

        // Trigger Dash
        if (_key_dash && can_dash) 
        {
            state = "DASH";
            dash_timer = dash_duration;
            can_dash = false;
            alarm[0] = dash_cooldown; // Reset can_dash after cooldown
            
            // Dash in current movement direction, or where facing if standing still
            dash_dir = (_is_moving) ? point_direction(0, 0, _hor, _ver) : image_angle;
        }
        break;

    case "DASH":
        // Dash movement
		is_invincible = true;
        hsp = lengthdir_x(dash_spd, dash_dir);
        vsp = lengthdir_y(dash_spd, dash_dir);
        
        dash_timer--;
        
        // Visual Juice: Ghost Trail
        if (dash_timer % 2 == 0) {
            var _g = instance_create_layer(x, y, "Instances", obj_ghost);
            _g.sprite_index = sprite_index;
            _g.image_angle = image_angle;
        }

		alarm[0] = game_get_speed(1);
        if (dash_timer <= 1) 
		{
        state = "MOVE";
		dash_cooldown = base_cooldown; 
        is_invincible = false; // Turn it off when dash ends
		}
		break;
>>>>>>> Stashed changes
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


