/// @description Movement

var map = layer_tilemap_get_id("Collisions");
//show_debug_message("Map: " + string(map));
var tile_at_bottom = tilemap_get_at_pixel(map, x,y);
//show_debug_message("Tile data: " + string(tile_at_bottom));

shoot_was_pressed = keyboard_check_pressed(vk_control);
walk_left_is_pressed = keyboard_check(vk_left);
walk_right_is_pressed = keyboard_check(vk_right);
jump_was_pressed = keyboard_check_pressed(vk_space);
var movement_key_is_pressed = walk_left_is_pressed || walk_right_is_pressed;

switch(current_player_state)
{
	case PlayerState.Idle:
	{
		if(was_hit)
		{
			scr_PlayerHit();
			break;
		}
		if(shoot_was_pressed)
		{
			scr_PlayerAttack();
		}
		else if (jump_was_pressed)
		{
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
			scr_PlayerHit();
			break;
		}
		
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
		//if(was_hit)
		//{
		//	scr_PlayerHit();
		//	break;
		//}
		scr_PlayerJumpUpdate();
		if(has_jumped && (image_index > 1))
		{
			scr_PlayerIdle();
		}
		break;
	}
	case PlayerState.Hurt:
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
	case PlayerState.Dying:
	{
		scr_PlayerDieUpdate();
	}
}

if(hp <= 0 && !is_dying) 
{
	scr_PlayerDie();
}
