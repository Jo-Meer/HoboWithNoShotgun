/// @description Init vars

// Sprite setup
sprite_idle = spr_specter_idle;
sprite_attack = spr_specter_attacking;
sprite_hit = spr_specter_hit;
sprite_walk = spr_specter_walk;
sprite_dying = spr_specter_dying;

// Weapon setup
weapon_range = 30;
weapon_y_offset_to_top = 38;
weapon_y_width = 10;
weapon_damage = 10;
weapon_attack_begin_frame = 5;
weapon_attack_duration_in_frames = 3;


hp = 25;
walk_speed = 1.5;

detection_range = 150;
attacking_range = 25;
seconds_to_despawn = 2;
seconds_of_attack_cooldown = 2;


sprite_attack_frame = 5;
has_attacked = false;
was_hit = false;
is_dying = false;
had_player_contact = false;

current_enemy_state = EnemyState.Idle;
current_facing_direction = -1;


time_of_death = 0;
time_of_last_attack = 0;