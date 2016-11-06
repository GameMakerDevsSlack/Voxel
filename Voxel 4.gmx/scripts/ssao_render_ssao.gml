///ssao_render_ssao()

d3d_end();

surface_set_target( ssao_srf_ssao );
draw_clear_alpha( c_white, 0.0 );

d3d_set_projection_ortho( 0, 0, view_wview[0], view_hview[0], 0 );
texture_set_repeat( false );
shader_set( shd_ssao_post );

texture_set_stage(      shader_get_sampler_index( shd_ssao_post, "depth_buffer" ),  surface_get_texture( ssao_srf_depth ) );
texture_set_stage(      shader_get_sampler_index( shd_ssao_post, "normal_buffer" ), surface_get_texture( ssao_srf_normal ) );
texture_set_stage(      shader_get_sampler_index( shd_ssao_post, "noise_buffer" ),  surface_get_texture( ssao_srf_noise ) );
texture_set_repeat_ext( shader_get_sampler_index( shd_ssao_post, "noise_buffer" ), true ); 

shader_set_uniform_f(shader_get_uniform( shd_ssao_post, "uCameraNear"), obj_camera.camera_znear );
shader_set_uniform_f(shader_get_uniform( shd_ssao_post, "uCameraFar"),  obj_camera.camera_zfar );

shader_set_uniform_f_array( shader_get_uniform( shd_ssao_post, "uInverseProjectionMatrix" ), matrix_inverse_projection );
shader_set_uniform_f_array( shader_get_uniform( shd_ssao_post, "uProjectionMatrix" ),        matrix_proj );

shader_set_uniform_f(       shader_get_uniform( shd_ssao_post,        "uScreenDimension"), view_wview[0], view_hview[0] );

shader_set_uniform_f_array( shader_get_uniform( shd_ssao_post,        "uSSAOKernel" ),    ssao_kernel );
shader_set_uniform_f(       shader_get_uniform( shd_ssao_post,        "uSSAORadius"),     ssao_radius );
shader_set_uniform_f(       shader_get_uniform( shd_ssao_post,        "uSSAOStrength"),   ssao_strength );
shader_set_uniform_f(       shader_get_uniform( shd_ssao_post,        "uSSAOPower"),      ssao_power );

draw_surface( ssao_srf_ssao, 0, 0 );

shader_reset();

d3d_start();

/*
with( obj_camera ) event_user( 0 );
with( par_3d ) {
    if ( select_over ) or ( select_down ) {
        d3d_set_fog( true, c_white, 0, 0 );
        event_user( 0 );
        d3d_set_fog( false, c_white, 0, 0 );
    }
}
*/

surface_reset_target();
