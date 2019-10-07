/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (triggered_at == current_time) {
	alarm_set(0, 130); // wake up Brutes after Crazy ran by
	
	ds_map_add(spawned_enemies, inst_EnemyBruteFight3a.id, inst_EnemyBruteFight3a);
	ds_map_add(spawned_enemies, inst_EnemyBruteFight3b.id, inst_EnemyBruteFight3b);
	
	inst_EnemyBruteFight3a.detection_range = 10;
	inst_EnemyBruteFight3b.detection_range = 10;

}

