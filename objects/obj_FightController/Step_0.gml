/// @description spawn enemies
if (!is_triggered) return;

var left_empty = ds_map_empty(left);
var right_empty = ds_map_empty(right);

if (left_empty && right_empty) {
	// all spawned enemies must be killed before proceeding
	var enemies_to_kill = ds_map_size(spawned_enemies) ;
	
	// no enemies left? step out.
	if (enemies_to_kill == 0) {
		instance_destroy();
		return;
	}
	
	// remove the instances that were killed from the list
	var key = ds_map_find_first(spawned_enemies);
	for (var i = 0; i < enemies_to_kill; i++;) {
		
		// get the enemy instance from the list
		var instance = ds_map_find_value(spawned_enemies, key);
		if (is_undefined(instance)) {
			show_debug_message(key);
			show_debug_message("is undefined");
			ds_map_delete(spawned_enemies, key);
		}
		else if (!instance_exists(instance) || instance.hp <= 0) {
			ds_map_delete(spawned_enemies, key);
		}
		// At least one enemy still lives? Fight goes on.
		else {
			break;
		}
		
		key = ds_map_find_next(spawned_enemies, key);
	}
   
	if (enemies_to_kill == 0) {
		instance_destroy();
	}
	return;
}

frames++;

var enemy_left = noone;
var enemy_right = noone;

if (!left_empty) {
	// if an enemy was added for this time
	if (ds_map_exists(left, frames)) {
		enemy_left = ds_map_find_value(left, frames);
		ds_map_delete(left, frames);
	}
}
if (!right_empty) {
	if (ds_map_exists(right, frames)) {
		enemy_right = ds_map_find_value(right, frames);
		ds_map_delete(right, frames);
	}
}

// add the enemies to the map
if (enemy_left != noone) {
	var instance = instance_create_layer(obj_Camera.left - 10, spawn_y, "Enemy", enemy_left);
	instance.detection_range = 480;
	instance.current_facing_direction = 1;
	ds_map_add(spawned_enemies, instance.id, instance);
}
if (enemy_right != noone) {
	var instance = instance_create_layer(obj_Camera.right + 10, spawn_y, "Enemy", enemy_right);
	instance.detection_range = 480;
	ds_map_add(spawned_enemies, instance.id, instance);
}