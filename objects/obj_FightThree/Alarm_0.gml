/// @description Wake up Brutes
// You can write your code in this editor
with (inst_EnemyBruteFight3a) {
	scr_EnemyUpdateRotation();
	scr_BruteDetectPlayer();
	had_player_contact = true;
}
with (inst_EnemyBruteFight3b) {
	scr_BruteDetectPlayer();
	had_player_contact = true;
}