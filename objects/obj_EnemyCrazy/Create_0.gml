/// @description Init vars

// Sprite setup
sprite_walk = spr_crazy_running;
sprite_dying = spr_crazy_dying;

// Weapon setup
weapon_damage = 40;

hp = 1;
walk_speed = 4;

has_attacked = false;
was_hit = false;
is_dying = false;
had_player_contact = false;
seconds_to_despawn = 2;

current_enemy_state = EnemyState.Walk;
current_facing_direction = -1;

time_of_death = 0;
