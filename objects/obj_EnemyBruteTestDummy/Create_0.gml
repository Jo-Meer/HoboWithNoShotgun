/// @description Init vars

// Sprite setup
sprite_idle = spr_brute_idle;
sprite_attack = spr_brute_attack;
sprite_hit = spr_brute_hit;
sprite_walk = spr_brute_walk;
sprite_dying = spr_brute_dying;

// Weapon setup
weapon_range = 15;
weapon_y_offset_to_top = 38;
weapon_x_offset_to_middle = 18;
weapon_y_width = 10;
weapon_damage = 0.1;


hp = 500;
walk_speed = 2;

detection_range = 150;
attacking_range = 35;
seconds_to_despawn = 2;
seconds_of_attack_cooldown = 0.5;


sprite_attack_frame = 8;
has_attacked = false;
was_hit = false;
is_dying = false;
had_player_contact = false;

current_enemy_state = EnemyState.Idle;

time_of_death = 0;
time_of_last_attack = 0;

// set to the correct starting position
if (start_direction == DIR_LEFT) {
	current_facing_direction = DIR_LEFT;
}
else {
	current_facing_direction = DIR_RIGHT;
	image_xscale = -1;
}
