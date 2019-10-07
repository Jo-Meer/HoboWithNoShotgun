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


// get all enemies that were hit and add damage to them
var enemies_hit = ds_list_create();
var number_of_enemies_hit = collision_line_list(left, top, right, bottom, obj_EnemyParent, false, true, enemies_hit, false);

if (number_of_enemies_hit > 0)
{
	for (var i = 0; i < number_of_enemies_hit; ++i;)
	{
		var enemy = enemies_hit[| i];
		enemy.hp -= weapon_damage;
		enemy.was_hit = true;
	}
}

ds_list_destroy(enemies_hit);