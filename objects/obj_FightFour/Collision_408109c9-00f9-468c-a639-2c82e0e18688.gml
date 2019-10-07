/// @description on enter
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (triggered_at == current_time) {
	inst_EnemyBruteCity1.had_player_contact = true;
	inst_EnemySpecterCity1.had_player_contact = true;
}