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
		else if (distance_to_player < jumping_range && direction_to_player != current_facing_direction) {
			had_player_contact = true;
			scr_PoliceJump();
		}
		else if(is_on_camera && distance_to_player <= attacking_range)
		{
			had_player_contact = true;
			scr_EnemyUpdateRotation();
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
			break;
		}
		scr_PoliceUpdateAttack();
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
			break;
		}
		scr_EnemyUpdateRotation();
		scr_EnemyUpdateWalk();
		if (distance_to_player < jumping_range && direction_to_player != current_facing_direction) {
			scr_PoliceJump();
		}
		else if(distance_to_player <= attacking_range)
		{
			if((time_of_last_attack + seconds_of_attack_cooldown * 1000000) <= get_timer())
			{
				scr_EnemyAttack();
			}
			else
			{
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
if(sprite_index==spr_police_hurt&&image_index==1){
	audio_play_sound(enemygothit,1500,false);
	
}
if(sprite_index==spr_police_death&&image_index==1){
	audio_play_sound(Die,1500,false);	
}

if(hp <= 0 && !is_dying) 
{
	scr_EnemyDie();
}