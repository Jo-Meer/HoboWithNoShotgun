/// @description Fade in/out

if(time_until_fade_in * 1000000 <= get_timer() - my_current_time && !is_faded_in)
{
	image_alpha = lerp(0, 1, fade_in_percent);
	fade_in_percent += fade_speed;
}

if(fade_in_percent >= 1)
{
	image_alpha = 1;
	is_faded_in = true;
}

if((time_until_fade_in + time_to_show)* 1000000 <= get_timer() - my_current_time)
{
	image_alpha = lerp(0, 1, fade_in_percent);
	fade_in_percent -= fade_speed;
}

if(is_faded_in && fade_in_percent <= 0)
{
	instance_destroy();
}