/// @description set enemies to spawn
// You can write your code in this editor

// we have a list for left and right
left = ds_map_create();
right = ds_map_create();

// maps are time based

// count all spawned enemies so that we know when the area is clear
spawned_enemies = ds_map_create();

ds_map_add(right, 210, obj_EnemySpecter);
ds_map_add(left, 720, obj_EnemyBrute);

spawn_y = obj_Player.y;

is_triggered = false;
frames = 0;
