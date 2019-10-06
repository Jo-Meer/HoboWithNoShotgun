/// @description Collision with ground

if(is_in_air)
{
	sprite_index = spr_HoboJump;
	image_index = 0;
	show_debug_message("Before: " + string(y));
	y = other.bbox_top;
	show_debug_message(y);
	is_in_air = false;
	has_jumped = true;
	show_debug_message("On Ground");
}