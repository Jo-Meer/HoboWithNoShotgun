/// @description Enemy
// Spectre is a quick attacker. 
// If you attack him from the front, you will get a hit back.
// You have to run or jump behind him to hit him in the back.

var distance_to_player = abs(obj_Player.x - x);
switch(current_enemy_state)
{
	case EnemyState.Idle:
	{
		var dir_player = (x - obj_Player.x > 0) ? -1 : 1;
		if(was_hit)
		{
			scr_EnemyHit();
			time_of_last_attack = 0; // reset attack cooldown
			break;
		}
		else if(dir_player != current_facing_direction) {
			scr_SpecterUpdateRotation();
		}
		else if(distance_to_player <= attacking_range)
		{
			had_player_contact = true;
			scr_SpecterUpdateRotation();
			if((time_of_last_attack + seconds_of_attack_cooldown * 1000000) <= get_timer())
			{
				scr_EnemyAttack();
			}
		} 
		else if(distance_to_player <= detection_range || had_player_contact)
		{
			had_player_contact = true;
			scr_EnemyWalk();
		}
		break;
	}
	case EnemyState.Attack:
	{
		if(was_hit)
		{
			scr_EnemyHit();
			time_of_last_attack = 0; // reset attack cooldown
			break;
		}
		scr_SpecterUpdateAttack();
		if(image_index > image_number -1)
		{			
			scr_EnemyIdle();
		}		
		break;
	}
	case EnemyState.Walk:
	{
		if(was_hit)
		{
			scr_EnemyHit();
			time_of_last_attack = 0; // reset attack cooldown
			break;
		}
		
		// update rotation
		var dir_player = (x - obj_Player.x > 0) ? -1 : 1;
		if (dir_player != current_facing_direction) {
			scr_EnemyIdle();
			break;
		}
		
		scr_EnemyUpdateWalk();
		if(distance_to_player <= attacking_range)
		{
			if((time_of_last_attack + seconds_of_attack_cooldown * 1000000) <= get_timer())
			{
				scr_EnemyAttack();
			}
			else
			{
				time_of_last_attack = min(time_of_last_attack, get_timer() - (seconds_of_attack_cooldown / 2) * 1000000);
				scr_EnemyIdle();
			}
		}
		break;
	}
	case EnemyState.Hurt:
	{
		had_player_contact = true;
		if(was_hit)
		{
			scr_EnemyHit();
			time_of_last_attack = 0; // reset attack cooldown
			break;
		}
		if(image_index > image_number -1)
		{
			scr_EnemyIdle();			
		}		
		break;
	}
	case EnemyState.Dying:
	{
		scr_EnemyUpdateDie();
		break;
	}
}

if(hp <= 0 && !is_dying) 
{
	scr_EnemyDie();
}