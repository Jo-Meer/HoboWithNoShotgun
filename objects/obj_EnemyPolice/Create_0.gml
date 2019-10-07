/// @description Init vars

// Sprite setup
sprite_idle = spr_police_idle;
sprite_attack = spr_police_attack;
sprite_hit = spr_police_hurt;
sprite_walk = spr_police_walk;
sprite_dying = spr_police_death;
sprite_jump = spr_police_jump;

hp = 25;
walk_speed = 2;
jump_speed = 6;

detection_range = 200;
attacking_range = 150;
jumping_range = 100;
seconds_to_despawn = 2;
seconds_of_attack_cooldown = 2;

sprite_attack_frame = 9;
has_attacked = false;
was_hit = false;
is_dying = false;
had_player_contact = false;

current_enemy_state = EnemyState.Idle;
current_facing_direction = DIR_LEFT;

projectile_x_offset = 32;
projectile_y_offset = 48;


time_of_death = 0;
time_of_last_attack = 0;