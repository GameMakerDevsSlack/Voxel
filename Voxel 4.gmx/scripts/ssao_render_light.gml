///ssao_render_light()

surface_set_target( srf_diffuse );
draw_clear( background_colour );

with( obj_light ) event_user( 1 );
with( obj_camera ) event_user( 0 );

if ( instance_exists( obj_light ) ) and ( light_on ) {
    
    with( obj_light ) {
        var _shader;
        if ( light_soft ) _shader = shd_light_soft else _shader = shd_light_hard;
        shader_set( _shader );
        shader_set_uniform_matrix_array( shader_get_uniform( _shader, "lightmatrix" ), light_proj_matrix );
        texture_set_stage( shader_get_sampler_index( _shader, "depthmap" ),            surface_get_texture ( light_depth_surface ) );
        shader_set_uniform_f( shader_get_uniform( _shader, "depthsize" ),              surface_get_width( light_depth_surface ) );
        shader_set_uniform_f( shader_get_uniform( _shader, "lightcol" ),               light_colour_r, light_colour_g, light_colour_b );
        shader_set_uniform_f( shader_get_uniform( _shader, "ambcol" ),                 light_ambient_r, light_ambient_g, light_ambient_b, 1 );
        draw_scene();
        shader_reset();
    }
    
} else {
    
    draw_scene();
    
}

with( par_3d ) {
    if ( select_down ) {
        d3d_set_fog( true, c_white, 0, 0 );
        event_user( 0 );
        d3d_set_fog( false, c_white, 0, 0 );
    } else if ( select_over ) {
        d3d_set_fog( true, c_ltgray, 0, 0 );
        event_user( 0 );
        d3d_set_fog( false, c_ltgray, 0, 0 );
    }
}

with( obj_light ) event_user( 0 );

surface_reset_target();
