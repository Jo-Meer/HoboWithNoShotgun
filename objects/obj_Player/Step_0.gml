/// @description Movement

shoot_was_pressed = keyboard_check_pressed(vk_control);
walk_left_is_pressed = keyboard_check(vk_left);
walk_right_is_pressed = keyboard_check(vk_right);
jump_was_pressed = keyboard_check_pressed(vk_space);
var movement_key_is_pressed = walk_left_is_pressed || walk_right_is_pressed;

if(sprite_index == spr_HoboRun && run == 0){
	audio_play_sound(Running,1500,true);
	run =1;
}else if(sprite_index != spr_HoboRun){
	audio_stop_sound(Running);
	run=0;
}
if(sprite_index == spr_HoboWithAShotgun && image_index==4){
	audio_play_sound(Shotgunpickup,1500,false);
}
switch(current_player_state)
{
	case PlayerState.Idle:
	{
		if(was_hit)
		{
			audio_play_sound(Puke,1500,false);
			scr_PlayerHit();
			break;
		}
		if(shoot_was_pressed)
		{
			
			scr_PlayerAttack();
			
		}
		else if (jump_was_pressed)
		{
			audio_play_sound(Jump,1500,false);
			scr_PlayerJump();
		}
		else if(movement_key_is_pressed)
		{
			scr_PlayerUpdateRotation();
			scr_PlayerWalk();
		}		
		break;
	}
	case PlayerState.Walk:
	{
		if(was_hit)
		{
			audio_play_sound(Puke,1500,false);
			scr_PlayerHit();
			break;
		}
		
		if(shoot_was_pressed)
		{
				
		
			scr_PlayerAttack();
			
				
		}
		else if(jump_was_pressed)
		{
			audio_play_sound(Jump,1500,false);
			scr_PlayerJump();
		}
		else if(movement_key_is_pressed)
		{
			scr_PlayerUpdateRotation();
			scr_PlayerWalkUpdate();
		}		
		else
		{
			scr_PlayerIdle();
		}
		break;
	}
	case PlayerState.Attack:
	{
		if(was_hit)
		{
			audio_play_sound(Puke,1500,false);
			scr_PlayerHit();
			break;
		}
		scr_PlayerAttackUpdate();
		if(image_index > image_number -1)
		{
			if(shoot_was_pressed)
			{
				scr_PlayerAttack();
			}
			else if(jump_was_pressed)
			{
				scr_PlayerJump();
			}
			else if(movement_key_is_pressed)
			{
				scr_PlayerUpdateRotation();
				scr_PlayerWalk();
			}			
			else 
			{
				scr_PlayerIdle();
			}
		}		
		break;
	}
	case PlayerState.Jump:
	{
		if(was_hit)
		{
			if(is_in_air)
			{
				scr_PlayerAirborneHit();
				audio_play_sound(Puke,1500,false);
			}
			else 
			{
				scr_PlayerHit();
				audio_play_sound(Puke,1500,false);
			}			
			break;
		}
		scr_PlayerJumpUpdate();
		if(has_jumped && (image_index > 1))
		{
			scr_PlayerIdle();
		}
		break;
	}
	case PlayerState.Hit:
	{
		if(was_hit)
		{
			scr_PlayerHit();
			break;
		}
		if(image_index > image_number -1)
		{
			if(shoot_was_pressed)
			{
				scr_PlayerAttack();
				
			}
			else if(jump_was_pressed)
			{
				scr_PlayerJump();
			}
			else if(movement_key_is_pressed)
			{
				scr_PlayerUpdateRotation();
				scr_PlayerWalk();
			}
			else 
			{
				scr_PlayerIdle();
			}
		}		
		break;
	}
	case PlayerState.AirbornHit:
	{
		scr_PlayerAirborneHitUpdate();
		if(!is_in_air)
		{
			scr_PlayerIdle();
		}
		break;
	}
	case PlayerState.Dying:
	{
		scr_PlayerDieUpdate();
	}
}

if(hp <= 0 && !is_dying && !is_in_air) 
{
	scr_PlayerDie();
}

if(x < sprite_get_xoffset(sprite_index))
{
	x = sprite_get_xoffset(sprite_index);
}

if (x > room_width - sprite_get_xoffset(sprite_index))
{
    x = room_width - sprite_get_xoffset(sprite_index);
}
