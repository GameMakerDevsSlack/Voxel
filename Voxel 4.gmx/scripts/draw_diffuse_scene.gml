///draw_diffuse_scene()

d3d_set_culling( true );
with( par_3d ) {
    if ( !select_down ) and ( !select_over ) event_user( 0 );
}

draw_set_colour( make_colour_rgb( 200, 100, 50 ) );
d3d_set_culling( false );
d3d_draw_wall( 460, 149, 30,  400, 149, 0,  background_get_texture( bck_white ), 1, 1 );
d3d_draw_floor( 400, 200, 0,  460, 149, 0,  background_get_texture( bck_white ), 1, 1 ); 
draw_set_colour( c_white );    
d3d_set_culling( true );
