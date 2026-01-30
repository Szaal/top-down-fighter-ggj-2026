/// @description Initate

// Stats
hp = 2;
atk = [3, 3, 8];
current_mask = "None";


// Speeds
player_speed = 4;
base_speed = 4;
rotate_speed = 1;


// Dashing
state = "MOVE";
hsp = 0;
vsp = 0;
can_dash = true;
dash_spd = 12;      
dash_duration = 8;  
base_cooldown = 30;
dash_cooldown = 30; 
dash_dir = 0;
is_invincible = false;

// Normalised Horizontal & Vertical

hsp = 0; vsp = 0;
target_angle = 0;