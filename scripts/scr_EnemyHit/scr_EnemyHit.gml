current_enemy_state = EnemyState.Hurt;

was_hit = false;

sprite_index = sprite_hit;
image_index = 0;
audio_play_sound(enemygothit,1500,false);

show_debug_message("Enemy got hit");