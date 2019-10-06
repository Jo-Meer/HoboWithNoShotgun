var player_x = argument0;
var player_y = argument1;
var player_direction = argument2;

var start_x = player_x + 12;
var start_y = player_y - 30;

if(player_direction < 0)
{
	start_x = player_x - 12;	
}

scr_FireProjectile(start_x, start_y, player_direction, obj_PlayerProjectile);