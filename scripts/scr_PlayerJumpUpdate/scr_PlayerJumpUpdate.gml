if(image_index > image_number - 1 && !is_in_air && !has_jumped)
{	
	image_speed = 0;
	current_gravity = jump_gravity;
	is_in_air = true;
	y += current_gravity;
	show_debug_message("Going in air");
}

var map = layer_tilemap_get_id("Collisions");
var tile_at_bottom = tilemap_get_at_pixel(map, x,y);

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

if(tile_at_bottom != 1)
{
	y += current_gravity;
	current_gravity += gravity_delta;
	show_debug_message("Not on Ground");
} 
else if(is_in_air)
{
	sprite_index = spr_HoboJump;
	image_index = 0;
	show_debug_message("Before: " + string(y));
	var i = 0;
	var tile;
	do
	{
		i++;
		tile = tilemap_get_at_pixel(map, x,y - i);		
	}
	until(tile != 1);
	y -= i;
	show_debug_message(y);
	is_in_air = false;
	has_jumped = true;
	show_debug_message("On Ground");
}

