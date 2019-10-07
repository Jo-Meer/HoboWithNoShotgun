current_player_state = PlayerState.Attack;

has_attacked = false;
sprite_index = current_attacking_sprite;
image_index = 0;
if(sprite_index == spr_HoboWithAShotgun){
				
					audio_play_sound(Shotgun,1500,false);
					
						
				
			}else if(sprite_index == spr_HoboFightBottle){
					audio_play_sound(Stabbing,1500,false);	
			}else{
					audio_play_sound(punch,1500,false);	
			}
show_debug_message("Hobo attack");

