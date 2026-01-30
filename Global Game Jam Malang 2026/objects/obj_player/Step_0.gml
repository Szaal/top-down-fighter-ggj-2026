/// @description Insert description here

// --- Keys ---
var _key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var _key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));

var _key_dash = keyboard_check(vk_space);

// Gets horizontal and vertical movement inputs.
var _hor = _key_right - _key_left; // Horizontal.
var _ver = _key_down - _key_up; // Vertical.

if (global.game_paused) { _hor = 0; _ver = 0; _key_dash = false; }

switch (state) 
{
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
        
        if (dash_timer % 2 == 0) {
            var _g = instance_create_layer(x, y, "Instances", obj_ghost);
            _g.sprite_index = sprite_index;
            _g.image_angle = image_angle;
        }

        if (dash_timer <= 1) 
		{
        state = "MOVE";
		dash_cooldown = base_cooldown; 
        is_invincible = false; // Turn it off when dash ends
		}
		break;
}

// --- MOVEMENT & ROTATION ---
x += hsp;
y += vsp;



// --- DASH RECHARGE INDICATOR ---
if (dash_cooldown > 0) 
{
    dash_cooldown--;
} 
else if (!can_dash) 
{
    can_dash = true;
    
    image_xscale = 1.5;
    image_yscale = 1.5;
}

image_xscale = lerp(image_xscale, 1, 0.2);
image_yscale = lerp(image_yscale, 1, 0.2);
