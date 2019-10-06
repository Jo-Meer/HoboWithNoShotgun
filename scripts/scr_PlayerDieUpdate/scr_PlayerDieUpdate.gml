var time = get_timer();

if(image_index > image_number - 1)
{
	
	image_speed = 0;
	show_debug_message("On ground");
	if (alarm_get(3) <= -1) { 
		alarm_set(3, 180);
	} else {
		show_debug_message(alarm_get(3));
	}
}