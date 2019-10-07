/// @description set enemies to spawn
// You can write your code in this editor

// we have a list for left and right
left = ds_map_create();
right = ds_map_create();

// maps are time based

// count all spawned enemies so that we know when the area is clear
spawned_enemies = ds_map_create();

spawn_y = obj_Player.y;

triggered_at = -1;
frames = 0;

// add enemies by time
// key is the amount of frames since encounter.
// value is enemytype
// ds_map_add(right, 210, obj_EnemySpecter);
// ds_map_add(left, 720, obj_EnemyBrute);