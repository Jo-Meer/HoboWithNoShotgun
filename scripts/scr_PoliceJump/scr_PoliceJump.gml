current_enemy_state = EnemyState.Jump;

sprite_index = sprite_jump;
image_index = 0;

// turn before jump
current_facing_direction = -current_facing_direction;
image_xscale = -image_xscale;

show_debug_message("Police Jumps");