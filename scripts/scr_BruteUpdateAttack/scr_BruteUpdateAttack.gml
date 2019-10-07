if(floor(image_index) == sprite_attack_frame && !has_attacked)
{
	audio_play_sound(punchenemy, 1500,false);
	has_attacked = true;
	time_of_last_attack = get_timer();
	
	var left = current_facing_direction == 1 ? x + weapon_x_offset_to_middle :
		x - weapon_range - weapon_x_offset_to_middle;
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