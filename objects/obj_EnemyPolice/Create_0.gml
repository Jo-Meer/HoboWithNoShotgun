/// @description Init vars

hp = 25;
walk_speed = 2;

detection_range = 150;
attacking_range = 100;
seconds_to_despawn = 2;
seconds_of_attack_cooldown = 2;

sprite_attack_frame = 11;
has_attacked = false;
was_hit = false;
is_dying = false;
had_player_contact = false;

current_enemy_state = EnemyState.Idle;
current_facing_direction = -1;

projectile_x_offset = 32;
projectile_y_offset = 48;

enum EnemyState
{
	Attack,
	Dying,
	Hurt,
	Idle,
	Walk
}

time_of_death = 0;
time_of_last_attack = 0;