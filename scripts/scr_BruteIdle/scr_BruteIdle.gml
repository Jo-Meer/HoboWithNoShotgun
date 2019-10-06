current_enemy_state = EnemyState.Idle;

if(had_player_contact)
{
	sprite_index = spr_brute_fightpose;
}
else
{
	sprite_index = sprite_idle;
}
image_index = 0;

show_debug_message("Police goes to idle");
