if(floor(image_index) == current_attacking_frame && !has_attacked)
{
	has_attacked = true;
	script_execute(current_weapon_script, x, y, current_facing_direction);
				
	show_debug_message("Hobo attack");
	
}