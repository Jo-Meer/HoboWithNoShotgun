current_player_state = PlayerState.AirbornHit;

hp -= receive_damage;
receive_damage = 0;
current_gravity = 0;

sprite_index = spr_HoboAirborneHit;
image_index = 0;
image_speed = 1;

show_debug_message("Hobo got hit in air");