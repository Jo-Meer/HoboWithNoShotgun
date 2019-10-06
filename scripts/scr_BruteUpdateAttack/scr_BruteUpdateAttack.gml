if(floor(image_index) == sprite_attack_frame && !has_attacked)
{
	has_attacked = true;
	time_of_last_attack = get_timer();
	
	var left = current_facing_direction == 1 ? x : x - weapon_range;
	var top =  y - weapon_y_offset_to_top;
	var right = left + weapon_range;
	var bottom = top + weapon_y_width;
	
	var inst;
	inst = collision_rectangle(left, top, right, bottom, obj_Player, false, true);
	if(inst != noone)
	{
		scr_DamagePlayer(weapon_damage)
	}
	
	show_debug_message("Brute attack");
}