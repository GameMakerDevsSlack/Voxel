/// generateNoise(surface)
var noiseSize = surface_get_width( argument0 );
surface_set_target(argument0);
draw_clear( c_white );
var xx=0, yy=0;
for( xx = 0; xx < noiseSize; xx++ ){
    for( yy = 0; yy < noiseSize; yy++ ){
    
        var r,g,mag;
        r = random(2) - 1;
        g = random(2) - 1;
        mag = sqrt((r * r) + (g * g));
        r /= mag;
        g /= mag;
        
        //draw_point_color(xx-1, yy, make_color_rgb(floor(r*255), floor(g*255), floor(b)));
        draw_point_color(xx-1, yy, make_color_rgb(floor(((r/2)+0.5) * 255),  floor(((g/2)+0.5) * 255), 127)); 
    }
}
 
surface_reset_target();