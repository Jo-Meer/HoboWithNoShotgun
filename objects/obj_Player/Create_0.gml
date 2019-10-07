/// @description Init vars
max_hp = 100;
hp = max_hp;
hit_protection_in_seconds = 0.5; // after any hit, the player is protected for a short time

walk_speed = 3;
current_idle_sprite = spr_HoboIdle;
current_moving_sprite = spr_HoboRun;

current_weapon_script = scr_Default;
current_attacking_sprite = spr_HoboFight;
current_attacking_frame = 2;
current_player_state = PlayerState.Idle;

has_attacked = false;
receive_damage = 0; // damage that will be inflicted on the player
is_dying = false;
time_of_last_enemy_hit = -10;

current_facing_direction = 0;

// Inputs
shoot_was_pressed = false;
walk_left_is_pressed = false;
walk_right_is_pressed = false;
jump_was_pressed = false;

// Jumping/Falling
current_gravity = 0;
gravity_delta = 0.5;
jump_gravity = -10;
in_air_horizontal_movement = 2;

is_in_air = false;
has_jumped = true;

enum PlayerState
{
	Attack,
	Dying,
	Hit,
	AirbornHit,
	Idle,
	Walk,
	Jump
}

run = 0;