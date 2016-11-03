///render_ssao_buffer()

d3d_end();

surface_set_target( ssao_buffer );
draw_clear_alpha( c_white, 0.0 );

d3d_set_projection_ortho( 0, 0, view_wview[0], view_hview[0], 0 );
texture_set_repeat( false );
shader_set( shd_ssao_post );

texture_set_stage(      shader_get_sampler_index( shd_ssao_post, "depth_buffer" ),  surface_get_texture( depth_buffer ) );
texture_set_stage(      shader_get_sampler_index( shd_ssao_post, "normal_buffer" ), surface_get_texture( normal_buffer ) );
texture_set_stage(      shader_get_sampler_index( shd_ssao_post, "noise_buffer" ),  surface_get_texture( global.ssao_noise ) );
texture_set_repeat_ext( shader_get_sampler_index( shd_ssao_post, "noise_buffer" ), true ); 

shader_set_uniform_f(shader_get_uniform( shd_ssao_post, "uCameraNear"), obj_camera.camera_znear );
shader_set_uniform_f(shader_get_uniform( shd_ssao_post, "uCameraFar"),  obj_camera.camera_zfar );

shader_set_uniform_f_array( shader_get_uniform( shd_ssao_post, "uInverseProjectionMatrix" ), matrix_inverse_projection );
shader_set_uniform_f_array( shader_get_uniform( shd_ssao_post, "uProjectionMatrix" ),        matrix_proj );

shader_set_uniform_f(       shader_get_uniform( shd_ssao_post,        "uScreenDimension"), view_wview[0], view_hview[0] );

shader_set_uniform_f_array( shader_get_uniform( shd_ssao_post,        "uSSAOKernel" ),    global.ssao_kernel );
shader_set_uniform_f(       shader_get_uniform( shd_ssao_post,        "uSSAORadius"),     global.ssao_radius );
shader_set_uniform_f(       shader_get_uniform( shd_ssao_post,        "uSSAOStrength"),   global.ssao_strength );
shader_set_uniform_f(       shader_get_uniform( shd_ssao_post,        "uSSAOPower"),      global.ssao_power );

    draw_surface( ssao_buffer, 0, 0 );

surface_reset_target();
d3d_start();
