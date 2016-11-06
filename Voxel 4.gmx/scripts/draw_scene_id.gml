///draw_scene_id()

d3d_set_culling( true );

with( par_3d ) {
    d3d_set_fog( true, make_colour_rgb( select_id mod 256, select_id div 256, 0 ), 0, 0 );
    event_user( 0 );
}

d3d_set_fog( true, c_black, 0, 0 );
draw_set_colour( make_colour_rgb( 200, 100, 50 ) );
d3d_set_culling( false );
d3d_draw_wall( 460, 149, 30,  400, 149, 0,  background_get_texture( bck_white ), 1, 1 );
d3d_draw_floor( 400, 200, 0,  460, 149, 0,  background_get_texture( bck_white ), 1, 1 ); 
draw_set_colour( c_white );    
d3d_set_culling( true );
d3d_set_fog( false, c_white, 0, 0 );
