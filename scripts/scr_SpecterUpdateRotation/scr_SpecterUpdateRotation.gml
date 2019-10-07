// Specter has a slight delay before rotations

var dir_player = (x - obj_Player.x > 0) ? -1 : 1;

// don't turn if looking in correct direction
if (dir_player == current_facing_direction) 
{
	_waiting_for_rotation = false;
	return;
} 

// request rotation if not done
if (!_waiting_for_rotation) {
	_waiting_for_rotation = true;
	time_rotation_requested = current_time;
	return;
}

// waiting for rotation
if (time_rotation_requested + milliseconds_of_rotation_delay >= current_time) 
{
	return;
}

// turn.
_waiting_for_rotation = false;
time_of_last_attack = get_timer() - (seconds_of_attack_cooldown * 0.75) * 1000000;
scr_EnemyUpdateRotation();