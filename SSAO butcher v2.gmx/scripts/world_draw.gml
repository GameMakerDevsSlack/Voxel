/*
draw_set_color(c_white);
texture_set_repeat(true);
var _i = 8;
d3d_model_draw( global.mapmodels[_i], 0, 0, 0, background_get_texture( asset_get_index( "bk"+string(_i))));
draw_set_color( c_white );
*/

d3d_set_culling( true );
d3d_transform_set_translation( 420, 150, 0 );
vertex_submit( global.vbf_pot, pr_trianglelist, background_get_texture( bk14 ) );
d3d_transform_set_translation( 437.5 + sin( current_time/600 ), 150, 0 );
vertex_submit( global.vbf_pot, pr_trianglelist, background_get_texture( bk14 ) );
d3d_transform_set_identity();

draw_set_colour( make_colour_rgb( 200, 100, 50 ) );
d3d_set_culling( false );
d3d_draw_wall( 460, 149, 30,  400, 149, 0,  background_get_texture( bk14 ), 1, 1 );
d3d_draw_floor( 460, 149, 0,  400, 200, 0,  background_get_texture( bk14 ), 1, 1 ); 
draw_set_colour( c_white );    
d3d_set_culling( true );
