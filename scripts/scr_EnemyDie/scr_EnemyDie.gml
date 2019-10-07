current_enemy_state = EnemyState.Dying;

// 
audio_play_sound(Die,1500,false);

is_dying = true;

sprite_index = sprite_dying;
image_index = 0;

show_debug_message("Enemy dies");