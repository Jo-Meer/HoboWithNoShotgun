/// @description Init vars

// Sprite setup
sprite_idle = spr_stalin_idle;
sprite_attack = spr_stalin_attack;
sprite_dying = spr_stalin_die;

hp = 300;

detection_range = 200;
seconds_to_despawn = 2000;
seconds_of_attack_cooldown = 2;

sprite_attack_frame_1 = 1;
sprite_attack_frame_2 = 3;
sprite_attack_frame_3 = 5;
sprite_attack_frame_4 = 7;

has_attacked = false;
was_hit = false;
is_dying = false;
had_player_contact = false;

current_enemy_state = EnemyState.Idle;
current_facing_direction = DIR_LEFT;

projectile_x_offset = 20;
projectile_y_offset = 30;

time_of_death = 0;
time_of_last_attack = 0;

time_hit = 0;

max_bullets = 4;
bullets = 4;

