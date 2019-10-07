current_player_state = PlayerState.Hit;

hp -= receive_damage;
receive_damage = 0;

sprite_index = spr_HoboHit;
image_index = 0;

show_debug_message("Hobo got hit");