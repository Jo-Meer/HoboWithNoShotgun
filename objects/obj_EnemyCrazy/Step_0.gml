/// @description Enemy

switch(current_enemy_state)
{		
	case EnemyState.Walk:
	{		
		scr_EnemyUpdateWalk();		
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