/// @description Insert description here
// You can write your code in this editor
shader_set(shader_colored_light);

// set rgb
shader_set_uniform_f(shader_red, red);
shader_set_uniform_f(shader_green, green);
shader_set_uniform_f(shader_blue, blue);

draw_surface(application_surface, 0, 0);
shader_reset();
