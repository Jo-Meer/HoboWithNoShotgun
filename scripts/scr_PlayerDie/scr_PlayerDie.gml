current_player_state = PlayerState.Dying;
audio_play_sound(Mumble,1500,false);
is_dying = true;

sprite_index = choose(spr_HoboDieBloody, spr_HoboDieOnShit);
image_index = 0;

show_debug_message("Hobo dies");