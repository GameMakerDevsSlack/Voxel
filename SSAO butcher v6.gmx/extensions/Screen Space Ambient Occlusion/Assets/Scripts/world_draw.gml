draw_set_color(c_white);
texture_set_repeat(true);

// draw
for( var i=0; i < 15; i++){
    d3d_model_draw( global.mapmodels[i], 0, 0, 0, background_get_texture( asset_get_index( "bk"+string(i))));
}

draw_set_color( c_white );
