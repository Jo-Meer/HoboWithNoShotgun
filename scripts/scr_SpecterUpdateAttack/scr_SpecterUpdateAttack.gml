if(image_index > weapon_attack_begin_frame && 
	image_index < weapon_attack_begin_frame + weapon_attack_duration_in_frames + 1 &&
	!has_attacked)
{
	has_attacked = true;
	time_of_last_attack = get_timer();
	
	var left = current_facing_direction == 1 ? x : x - weapon_range;
	left += current_facing_direction * 5; // start a bit off-center
	var top =  y - weapon_y_offset_to_top;
	var right = left + weapon_range;
	var bottom = top + weapon_y_width;
	
	var inst;
	inst = collision_rectangle(left, top, right, bottom, obj_Player, false, true);
	if(inst != noone)
	{
		scr_DamagePlayer(weapon_damage)
	}
	
	show_debug_message("Specter attack");
}