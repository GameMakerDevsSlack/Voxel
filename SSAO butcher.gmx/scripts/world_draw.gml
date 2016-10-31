draw_set_color(c_white);
texture_set_repeat(true);
var _i = 8;
d3d_model_draw( global.mapmodels[_i], 0, 0, 0, background_get_texture( asset_get_index( "bk"+string(_i))));
draw_set_color( c_white );

d3d_set_culling( true );
d3d_transform_set_translation( 420, 150, 0 );
vertex_submit( global.vbf_pot, pr_trianglelist, background_get_texture( bk14 ) );
d3d_transform_set_identity();
