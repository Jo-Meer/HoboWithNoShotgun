/// @description Insert description here
// You can write your code in this editor
shader_set(shader_colored_light);

// set rgb
shader_set_uniform_f(shader_red, red);
shader_set_uniform_f(shader_green, green);
shader_set_uniform_f(shader_blue, blue);

if window_get_fullscreen(){
    draw_surface(application_surface,floor(dw/2-ww/2),floor(dh/2-hh/2));
} else {
    draw_surface(application_surface,0,0);
}

shader_reset();
