if(floor(image_index) == sprite_attack_frame && !has_attacked)
{
	has_attacked = true;
	time_of_last_attack = get_timer();
	var start_x = x + projectile_x_offset;
	var start_y = y - projectile_y_offset;

	if(current_facing_direction < 0)
	{
		start_x = x - projectile_x_offset;	
	}

	scr_FireProjectile(start_x, start_y, current_facing_direction, obj_EnemyProjectile);			
	show_debug_message("Police shoot");
}