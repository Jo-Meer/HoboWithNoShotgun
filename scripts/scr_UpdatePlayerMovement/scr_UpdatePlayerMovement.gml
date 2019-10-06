var x_delta;

if(keyboard_check(vk_left))
{
	requested_facing_direction = -1;
	x_delta = -x_speed;
	is_moving = true;
}
else if(keyboard_check(vk_right))
{
	requested_facing_direction = 1;
	x_delta = x_speed;
	is_moving = true;
}
else
{
	is_moving = false;
	facing_direction = 0;
	requested_facing_direction = 0;
}

if(is_moving && !is_attacking)
{
	facing_direction = requested_facing_direction;
	x += x_delta;
	image_xscale = facing_direction;
	sprite_index = current_moving_sprite;
	current_facing_direction = requested_facing_direction;
}
else if(is_attacking)
{
	sprite_index = current_attacking_sprite;
}
else
{
	sprite_index = current_idle_sprite;
}
var x_offset = sprite_xoffset;
if(image_xscale < 0)
{
	x_offset = -sprite_xoffset;
}
if(x - x_offset < 0)
{	
	x = x_offset;	
}