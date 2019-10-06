if(image_index > image_number - 1 && !is_in_air && !has_jumped)
{	
	image_speed = 0;
	current_gravity = jump_gravity;
	is_in_air = true;
	y += current_gravity;
	show_debug_message("Going in air");
}

if(is_in_air && (walk_left_is_pressed || walk_right_is_pressed))
{
	scr_PlayerUpdateRotation();
	if(current_facing_direction > 0)
	{
		x += in_air_horizontal_movement;	
	}
	else
	{
		x -= in_air_horizontal_movement;
	}
	image_xscale = current_facing_direction;
}

if(is_in_air && current_gravity > 0)
{
	sprite_index = spr_HoboAirborne;
	image_speed = 1;
}

if(is_in_air)
{
	y += current_gravity;
	current_gravity += gravity_delta;
	show_debug_message("Not on Ground");
}

