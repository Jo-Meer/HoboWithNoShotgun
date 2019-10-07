/// @move with you
var _cam_x;
if (instance_exists(obj_Camera)) {
	_cam_x = obj_Camera.left;
} else {
	_cam_x = camera_get_view_x(view_camera[0]);
}
x = _cam_x + xstart;