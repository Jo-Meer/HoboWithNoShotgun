/// @description move camera
// You can write your code in this editor

x += clamp(((x_to - x) / 15), -10, 10);
x = clamp(x, 480 / 2, room_width - (480 / 2));

// update calculated sides
left = x - (480/2);
right = x + (480/2);

if (follow != noone) {
	with(follow) {
		if (self.object_index == obj_Player) {
			
			other.x_to = x + 50;
			
			var enemy = instance_nearest(x, y, obj_EnemyParent);
			if (enemy && enemy.object_index != obj_EnemyCrazy && enemy.hp > 0 && distance_to_point(enemy.x, enemy.y) < 150) {
				other.x_to = (other.x_to + enemy.x) / 2;
			}
		}
		else {
			other.x_to = x;
		}
	}
	
}

// update the view matrix
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);
