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

// remove when leaving camera
if (instance_exists(obj_Camera)) {
	if (current_facing_direction == 1 && x > obj_Camera.right + 40) {
		instance_destroy();
	}
	else if (current_facing_direction == -1 && x < obj_Camera.left - 40) {
		instance_destroy();
	}
}

/*if(x < view_left-50)
{
	
}

if (x > view_right +50 )
{
   
}*/