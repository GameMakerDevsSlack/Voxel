draw_set_color(c_white);
texture_set_repeat(true);
var _i = 8;
d3d_model_draw( global.mapmodels[_i], 0, 0, 0, background_get_texture( asset_get_index( "bk"+string(_i))));
draw_set_color( c_white );
