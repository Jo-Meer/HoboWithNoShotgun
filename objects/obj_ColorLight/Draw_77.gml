/// @description Insert description here
// You can write your code in this editor
shader_set(shader_colored_light);

// set rgb
shader_set_uniform_f(shader_red, red);
shader_set_uniform_f(shader_green, green);
shader_set_uniform_f(shader_blue, blue);

//draw_surface(application_surface, 0, 0);

var ww = window_get_width();
var wh = window_get_height();

var w = ww;
var h = (ww / 16) * 9;

// vertical
// ----------- 
// |          |
// -----------
if (wh < h) {
	w = wh / 9 * 16;
	h = wh;
}

draw_surface_stretched(application_surface, ww / 2 - w / 2, wh / 2 - h / 2, w, h);
shader_reset();
