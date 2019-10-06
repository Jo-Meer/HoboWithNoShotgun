if(x - obj_Player.x > 0)
{
	current_facing_direction = -1;				
}
else 
{
	current_facing_direction = 1;
}	
image_xscale = -current_facing_direction;