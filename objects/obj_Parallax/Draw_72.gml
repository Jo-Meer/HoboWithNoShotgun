/// @description Insert description here
// You can write your code in this editor

// STEP EVENT OF THE PLAYER OR SOME CONTROLLER OBJECT
var _cam_x;
if (instance_exists(obj_Camera)) {
	_cam_x = obj_Camera.left;
} else {
	_cam_x = camera_get_view_x(view_camera[0]);
}
x = (_cam_x * factor) + xstart + offset;