/// @description Stalin
switch(current_enemy_state)
{
	case EnemyState.Idle:
	{	
		if(was_hit)
		{
			scr_StalinHit();
		}
		if(!deactivated && (time_of_last_attack + seconds_of_attack_cooldown * 1000000) <= get_timer())
		{
			scr_EnemyAttack();
		}
		break;
	}
	case EnemyState.Attack:
	{
		if(was_hit)
		{
			scr_StalinHit();
		}
		scr_StalinUpdateAttack();
		if(image_index > image_number -1)
		{			
			scr_EnemyIdle();
			bullets = max_bullets;
		}		
		break;
	}
	case EnemyState.Dying:
	{
		scr_EnemyUpdateDie();
		break;
	}
}

if (time_hit > current_time - 1000) {
	image_blend = make_colour_hsv(255, 255, random(255));
}
else {
	image_blend = -1;
}

if(hp <= 0 && !is_dying) 
{
	scr_EnemyDie();
}