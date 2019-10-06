/// @description Enemy

var distance_to_player = distance_to_object(obj_Player);
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
			scr_PoliceAttack();
		} 
		else if(distance_to_player <= detection_range)
		{
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
			scr_PoliceUpdateRotation();
			if(distance_to_player <= attacking_range)
			{
				scr_PoliceAttack();
			} 
			else if(distance_to_player > attacking_range)
			{
				scr_PoliceWalk();
			}
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
			scr_PoliceAttack();
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
			scr_PoliceUpdateRotation();
			if(distance_to_player <= attacking_range)
			{
				scr_PoliceAttack();
			} 
			else if(distance_to_player > attacking_range)
			{
				scr_PoliceWalk();
			}
		}		
		break;
	}
	case EnemyState.Dying:
	{
		scr_PoliceUpdateDie();
	}
}

if(hp <= 0 && !is_dying) 
{
	scr_PoliceDie();
}