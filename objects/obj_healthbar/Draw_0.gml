/// @show it

draw_self();
if (obj_Player.hp <= 0) exit;
draw_health = lerp(draw_health, obj_Player.hp , 0.1);
draw_set_color(c_white);
draw_rectangle(x, y+2, x+97*draw_health/obj_Player.max_hp, y+17, false);
draw_set_color(c_red);
draw_rectangle(x+94*draw_health/obj_Player.max_hp, y+2, x+97*draw_health/obj_Player.max_hp, y+17, false);
draw_set_color(c_white);
