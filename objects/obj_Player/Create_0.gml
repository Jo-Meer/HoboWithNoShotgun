/// @description Init vars

hp = 100;

walk_speed = 3;
current_idle_sprite = spr_HoboIdle;
current_moving_sprite = spr_HoboRun;

current_weapon_script = scr_Default;
current_attacking_sprite = spr_HoboFight;
current_attacking_frame = 2;
current_player_state = PlayerState.Idle;

has_attacked = false;
was_hit = false;
is_dying = false;

current_facing_direction = 0;

// Inputs
shoot_was_pressed = false;
walk_left_is_pressed = false;
walk_right_is_pressed = false;

enum PlayerState
{
	Attack,
	Dying,
	Hurt,
	Idle,
	Walk,
	Jump
}