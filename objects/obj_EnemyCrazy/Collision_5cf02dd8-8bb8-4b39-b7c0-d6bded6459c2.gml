/// @description Attack player

if(!has_attacked) 
{
	audio_play_sound(punch,1500, false);
	scr_DamagePlayer(weapon_damage);
	
	has_attacked = true;
}
