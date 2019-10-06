/// @description Pickup weapon

with(other) {
	//other.current_idle_sprite = weapon_idle_sprite;
	//other.current_moving_sprite = weapon_moving_spite;
	other.current_weapon_script = weapon_script;
	other.current_attacking_sprite = attacking_sprite;
	other.current_attacking_frame = attacking_frame;
	if(sprite_index == spr_HoboWithAShotgun){
		audio_play_sound(Shotgunpickup,1500,false);	
	}
	instance_destroy();
}