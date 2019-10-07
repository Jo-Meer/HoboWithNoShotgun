/// @description create camera
// You can write your code in this editor

camera = camera_create();

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(480, 270, 1, 100000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

//camera = camera_create_view(0, 0, 480, 270);

view_camera[0] = camera;

y = 270 / 2;
x = max(obj_Player.x, 480/2);

left = x - (480/2);
right = x + (480/2);


x_to = x;

follow = obj_Player;
