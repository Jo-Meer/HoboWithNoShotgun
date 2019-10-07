/// @show it

draw_self();
if (obj_EnemyStalin.hp <= 0) exit;
draw_health = lerp(draw_health, obj_EnemyStalin.hp , 0.1);
draw_set_color(c_red);
draw_rectangle(x+2, y+2, x+97*draw_health/obj_EnemyStalin.hp_max, y+17, false);
draw_set_color(c_white);

