/// @health up

hp= max_hp
audio_play_sound(Smoking,1500,false);
with(other){
	instance_destroy();	
}