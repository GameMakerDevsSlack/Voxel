///world_draw()

/*
d3d_transform_set_translation( 420, 150, 0 );
vertex_submit( global.vbf_pot, pr_trianglelist, background_get_texture( bck_white ) );
d3d_transform_set_translation( 437.5 + sin( current_time/600 ), 150, 0 );
vertex_submit( global.vbf_pot, pr_trianglelist, background_get_texture( bck_white ) );
d3d_transform_set_identity();
*/

d3d_set_culling( true );
with( obj_pot ) event_user( 0 );

draw_set_colour( make_colour_rgb( 200, 100, 50 ) );
d3d_set_culling( false );
d3d_draw_wall( 460, 149, 30,  400, 149, 0,  background_get_texture( bck_white ), 1, 1 );
d3d_draw_floor( 460, 149, 0,  400, 200, 0,  background_get_texture( bck_white ), 1, 1 ); 
draw_set_colour( c_white );    
d3d_set_culling( true );
