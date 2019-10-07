draw_set_font(pixel2);

draw_set_halign(fa_center)
draw_text(room_width/2,yy,thescrollingtext)
yy=yy-0.5 //+1 if you want it to move down.
//Change the -1 or +1 to a different number to adjust the speed.
//It goes by pixels per tick.