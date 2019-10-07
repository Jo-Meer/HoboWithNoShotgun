var current_time_sec = get_timer() / 1000000;
if(time_of_last_enemy_hit + hit_protection_in_seconds <= current_time_sec)
{
	current_player_state = PlayerState.Hit;

	hp -= receive_damage;

	if (instance_exists(obj_Camera)) {
		obj_Camera.shake = receive_damage / 5;
	}

	
	time_of_last_enemy_hit = current_time_sec;

	sprite_index = spr_HoboHit;
	image_index = 0;

	show_debug_message("Hobo got hit");
}
else
{
	
	show_debug_message("Hobo is protected");
}

receive_damage = 0;