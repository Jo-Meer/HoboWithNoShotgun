/// @description Enemy

var distance_to_player = abs(obj_Player.x - x);
show_debug_message(distance_to_player);
switch(current_enemy_state)
{
	case EnemyState.Idle:
	{		
		if(was_hit)
		{
			scr_PoliceHit();
			break;
		}
		else if(distance_to_player <= attacking_range)
		{
			had_player_contact = true;
			scr_PoliceUpdateRotation();
			if((time_of_last_attack + seconds_of_attack_cooldown * 1000000) <= get_timer())
			{
				scr_PoliceAttack();
			}			
		} 
		else if(distance_to_player <= detection_range || had_player_contact)
		{
			had_player_contact = true;
			scr_PoliceWalk();
		}
		break;
	}
	case EnemyState.Attack:
	{
		if(was_hit)
		{
			scr_PoliceHit();
			break;
		}
		scr_PoliceUpdateAttack();
		if(image_index > image_number -1)
		{			
			scr_PoliceIdle();
		}		
		break;
	}
	case EnemyState.Walk:
	{
		if(was_hit)
		{
			scr_PoliceHit();
			break;
		}
		scr_PoliceUpdateRotation();
		scr_PoliceUpdateWalk();
		if(distance_to_player <= attacking_range)
		{
			if((time_of_last_attack + seconds_of_attack_cooldown * 1000000) <= get_timer())
			{
				scr_PoliceAttack();
			}
			else
			{
				scr_PoliceIdle();
			}
		}
		break;
	}
	case EnemyState.Hurt:
	{
		if(was_hit)
		{
			scr_PoliceHit();
			break;
		}
		if(image_index > image_number -1)
		{
			scr_PoliceIdle();
			//scr_PoliceUpdateRotation();
			//if(distance_to_player <= attacking_range)
			//{
			//	scr_PoliceAttack();
			//} 
			//else if(distance_to_player > attacking_range)
			//{
			//	scr_PoliceWalk();
			//}
		}		
		break;
	}
	case EnemyState.Dying:
	{
		scr_PoliceUpdateDie();
		break;
	}
}

if(hp <= 0 && !is_dying) 
{
	scr_PoliceDie();
}