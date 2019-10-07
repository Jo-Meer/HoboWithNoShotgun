/// @description lock camera, start spawning
if (triggered_at != -1) return;

// lock the camera to the screen
obj_Camera.follow = self;

triggered_at = current_time;
frames = 0;