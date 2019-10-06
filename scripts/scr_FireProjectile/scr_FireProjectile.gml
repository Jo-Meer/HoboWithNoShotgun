var start_x = argument0;
var start_y = argument1;
var player_direction = argument2;
var projectile_object = argument3;

var inst = instance_create_layer(start_x, start_y,"Projectiles", projectile_object);

with(inst)
{
	inst.bullet_direction = player_direction;
	inst.image_xscale = player_direction;
}