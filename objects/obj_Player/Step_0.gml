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

switch(current_player_state)
{
	case PlayerState.Idle:
	{
		if(receive_damage > 0)
		{
			audio_play_sound(Puke,1500,false);
			scr_PlayerHit();
			break;
		}
		if(shoot_was_pressed)
		{
			if(sprite_index == spr_HoboWithAShotgun){
					audio_play_sound(Shotgun,1500,false);	
			}else if(sprite_index == spr_HoboFightBottle){
					audio_play_sound(Stabbing,1500,false);	
			}else{
					audio_play_sound(punch,1500,false);	
			}
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
		if(receive_damage > 0)
		{
			audio_play_sound(Puke,1500,false);
			scr_PlayerHit();
			break;
		}
		
		if(shoot_was_pressed)
		{
			
			scr_PlayerAttack();
			
			// play sounds
			if(sprite_index == spr_HoboWithAShotgun) 
			{
				audio_play_sound(Shotgun,1500,false);	
			} 
			else if(sprite_index == spr_HoboFightBottle)
			{
				audio_play_sound(Stabbing,1500,false);	
			} 
			else
			{
				audio_play_sound(punch,1500,false);	
			}
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
		if(receive_damage > 0)
		{
			audio_play_sound(Puke,1500,false);
			scr_PlayerHit();
			// can't be hit while attacking
			// makes fights a bit easier
			//receive_damage = 0;
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
		if(receive_damage > 0)
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
		if(receive_damage > 0)
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

var view_left = camera_get_view_x(view_camera[0]);
var view_right = view_left + camera_get_view_width(view_camera[0]);
var border_distance = 20;

if (instance_exists(obj_Camera)) {
	view_left = obj_Camera.x - 480/2;
	view_right = obj_Camera.x + 480/2;
}

if(x < view_left + border_distance)
{
	x = view_left + border_distance;
}

if (x > view_right - border_distance)
{
    x = view_right - border_distance;
}
