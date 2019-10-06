if(is_in_air)
{
	y += current_gravity;
	current_gravity += gravity_delta;
	show_debug_message("Not on Ground");
} 
