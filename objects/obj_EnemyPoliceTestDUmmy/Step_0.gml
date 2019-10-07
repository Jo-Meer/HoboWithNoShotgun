/// @description Police

var distance_to_player = abs(obj_Player.x - x);
var direction_to_player = (x - obj_Player.x > 0) ? -1 : 1;

var is_on_camera = true;
if (instance_exists(obj_Camera)) {
	is_on_camera = x < obj_Camera.right && x > obj_Camera.left;
}
else {
	show_debug_message("No camera found.");
}
switch(current_enemy_state)
{
	case EnemyState.Idle:
	{		
		if(was_hit)
		{
			scr_EnemyHit();
			break;
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
					
			scr_EnemyIdle();
				
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
		
			
		scr_EnemyIdle();
		
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
			scr_EnemyIdle();			
		}		
		break;
	}
	case EnemyState.Jump:
	{
		if(was_hit)
		{
			scr_EnemyHit();
			break;
		}
		scr_PoliceUpdateJump();
		if(image_index > image_number -1) {
			time_of_last_attack = 0; // can attack immediately after jump
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
