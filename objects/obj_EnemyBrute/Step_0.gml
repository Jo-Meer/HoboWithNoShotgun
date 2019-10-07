/// @description Enemy

var distance_to_player = abs(obj_Player.x - x);
switch(current_enemy_state)
{
	case EnemyState.Idle:
	{
		var dir_player = (x - obj_Player.x > 0) ? -1 : 1;
		if(was_hit)
		{
			scr_EnemyHit();
			break;
		}
		else if(distance_to_player <= attacking_range)
		{
			// don't notice when facing away
			if (!had_player_contact && current_facing_direction != dir_player) {
				break;
			}
			had_player_contact = true;
			scr_EnemyUpdateRotation();
			if((time_of_last_attack + seconds_of_attack_cooldown * 1000000) <= get_timer())
			{
				scr_EnemyAttack();
			}			
		} 
		else if(distance_to_player <= detection_range || had_player_contact)
		{
			if(!had_player_contact)
			{
				// don't notice when facing away
				if (current_facing_direction != dir_player) {
					break;
				}
			
				scr_BruteDetectPlayer();
				had_player_contact = true;	
			}
			else
			{
				scr_EnemyWalk();
			}					
		}
		break;
	}
	case EnemyState.Attack:
	{
		if(was_hit)
		{
			scr_EnemyHit();
			break;
		}
		scr_BruteUpdateAttack();
		if(image_index > image_number - 1)
		{			
			scr_BruteIdle();
		}		
		break;
	}
	case EnemyState.Walk:
	{
		if(was_hit)
		{
			scr_EnemyHit();
			break;
		}
		scr_EnemyUpdateRotation();
		scr_EnemyUpdateWalk();
		if(distance_to_player <= attacking_range)
		{
			if((time_of_last_attack + seconds_of_attack_cooldown * 1000000) <= get_timer())
			{
				scr_EnemyAttack();
			}
			else
			{
				scr_BruteIdle();
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
			break;
		}
		if(image_index > image_number -1)
		{
			scr_BruteIdle();			
		}		
		break;
	}
	case EnemyState.Dying:
	{
		scr_EnemyUpdateDie();
		break;
	}
	case EnemyState.PlayerDetection:
	{
		if(was_hit)
		{
			scr_EnemyHit();
			break;
		}
		if(image_index > image_number -1)
		{
			scr_BruteIdle();			
		}
	}
}

if(hp <= 0 && !is_dying) 
{
	scr_EnemyDie();
}