if(floor(image_index) == sprite_attack_frame_1 && bullets >= 4)
{
	bullets--;
	has_attacked = true;
	
	audio_play_sound(Shot,1500,false);
	
	time_of_last_attack = get_timer();
	
	var start_x = x + projectile_x_offset;
	var start_y = y - projectile_y_offset;

	if(current_facing_direction < 0)
	{
		start_x = x - projectile_x_offset;
	}
	
	scr_FireProjectile(start_x, start_y, current_facing_direction, obj_EnemyProjectile);
	show_debug_message("Stalin shoot");
}

if(floor(image_index) == sprite_attack_frame_2 && bullets >= 3)
{
	bullets--;
	has_attacked = true;
	
	audio_play_sound(Shot,1500,false);
	
	time_of_last_attack = get_timer();
	
	var start_x = x + projectile_x_offset;
	var start_y = y - projectile_y_offset;

	if(current_facing_direction < 0)
	{
		start_x = x - projectile_x_offset;
	}
	
	scr_FireProjectile(start_x, start_y, current_facing_direction, obj_EnemyProjectile);
	show_debug_message("Stalin shoot");
}

if(floor(image_index) == sprite_attack_frame_3 && bullets >= 2)
{
	bullets--;
	has_attacked = true;
	
	audio_play_sound(Shot,1500,false);
	
	time_of_last_attack = get_timer();
	
	var start_x = x + projectile_x_offset;
	var start_y = y - projectile_y_offset;

	if(current_facing_direction < 0)
	{
		start_x = x - projectile_x_offset;
	}
	
	scr_FireProjectile(start_x, start_y, current_facing_direction, obj_EnemyProjectile);
	show_debug_message("Stalin shoot");
}


if(floor(image_index) == sprite_attack_frame_4 && bullets >= 1)
{
	bullets--;
	has_attacked = true;
	
	audio_play_sound(Shot,1500,false);
	
	time_of_last_attack = get_timer();
	
	var start_x = x + projectile_x_offset;
	var start_y = y - projectile_y_offset;

	if(current_facing_direction < 0)
	{
		start_x = x - projectile_x_offset;
	}
	
	scr_FireProjectile(start_x, start_y, current_facing_direction, obj_EnemyProjectile);
	show_debug_message("Stalin shoot");
}