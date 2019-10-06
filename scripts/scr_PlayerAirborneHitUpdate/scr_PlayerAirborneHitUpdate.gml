var map = layer_tilemap_get_id("Collisions");
var tile_at_bottom = tilemap_get_at_pixel(map, x,y);

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
	y = real(y&$ffffffc0);
	is_in_air = false;	
	show_debug_message("On Ground");
}