var player_x = argument0;
var player_y = argument1;
var player_direction = argument2;
var weapon_distance = argument3;
var weapon_damage = argument4;

var left = player_x + 12;
var top = player_y - 45;
var right = left + weapon_distance;
var bottom = top + 10;
if(player_direction < 0)
{
	right = player_x - 12;
	left = right - weapon_distance;	
}


var nearest_enemy = noone;
var smallest_distance = weapon_distance;
for (var i = 0; i < instance_number(obj_EnemyParent); i += 1)
{	
	var instance = instance_find(obj_EnemyParent, i);
	var inst;
	inst = collision_line(left, top, right, bottom, instance, false, true);
	if(inst != noone)
	{
		var distance = distance_to_object(inst);
		if(distance < smallest_distance)
		{
			smallest_distance = distance;
			nearest_enemy = inst;
		}
	}
}

if nearest_enemy != noone
{
   with (nearest_enemy)
   { 
	   nearest_enemy.hp -= weapon_damage;
	   nearest_enemy.was_hit = true;
   }
}