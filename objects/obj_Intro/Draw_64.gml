/// @GUI
//Rectangles
draw_sprite_ext(s_pixel,0,0,0,1024,120,0,c_black,1);
draw_sprite_ext(s_pixel,0,0,650,1024,120,0,c_black,1);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(pixel);
draw_text(500, 680,print);

if(holdspace > 0){
	draw_text(500,50,"Hold SPACE to skip");	
}






//fading in
draw_sprite_ext(s_pixel,0,0,0,1024,768,0,c_black,a);
