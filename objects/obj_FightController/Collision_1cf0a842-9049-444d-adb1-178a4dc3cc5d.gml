/// @description lock camera, start spawning

if (is_triggered) return;

// lock the camera to the screen
obj_Camera.follow = self;

is_triggered = true;
frames = 0;
