///render_blur_ssao()

d3d_end();
d3d_set_projection_ortho( 0, 0, view_wview[0], view_hview[0], 0 );
shader_set( sh_post_ssao_blur );

texture_set_stage( shader_get_sampler_index( sh_post_ssao_blur, "depth_buffer" ),   surface_get_texture( depth_buffer ) );
texture_set_stage( shader_get_sampler_index( sh_post_ssao_blur, "normal_buffer" ),  surface_get_texture( normal_buffer ) );
shader_set_uniform_f( shader_get_uniform( sh_post_ssao_blur, "uSSAOResolution"),   global.SSAO_RESOLUTION );
shader_set_uniform_f( shader_get_uniform( sh_post_ssao_blur, "uScreenResolution"), view_wview[0], view_hview[0] );

repeat( global.SSAO_BLUR_PASSES ) {
    
    surface_set_target( ssao_buffer_temp );
    shader_set_uniform_f( shader_get_uniform( sh_post_ssao_blur, "uPixelCheck"), 1.0, 0.0 );
    draw_surface( ssao_buffer, 0, 0 );
    surface_reset_target();
    
    surface_set_target( ssao_buffer );
    shader_set_uniform_f( shader_get_uniform( sh_post_ssao_blur, "uPixelCheck"), 0.0, 1.0 );
    draw_surface( ssao_buffer_temp, 0, 0 );
    surface_reset_target();
   
}

shader_reset();
d3d_start();
