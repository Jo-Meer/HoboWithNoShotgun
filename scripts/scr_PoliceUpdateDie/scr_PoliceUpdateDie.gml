var time = get_timer();

if(image_index > image_number - 1 && time_of_death == 0)
{
	time_of_death = time;
	image_speed = 0;
	show_debug_message("On ground");
}
if(time_of_death != 0 && ((time_of_death + seconds_to_despawn * 1000000) <= time))
{
	show_debug_message("Despawn");
	instance_destroy();
}