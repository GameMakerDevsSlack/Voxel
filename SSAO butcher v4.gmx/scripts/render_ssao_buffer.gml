///render_ssao_buffer()

d3d_end();

surface_set_target( ssao_buffer );
draw_clear_alpha( c_white, 0.0 );

d3d_set_projection_ortho( 0, 0, view_wview[0], view_hview[0], 0 );
texture_set_repeat( false );
shader_set( sh_post_ssao );

texture_set_stage(      shader_get_sampler_index( sh_post_ssao, "depth_buffer" ),  surface_get_texture( depth_buffer ) );
texture_set_stage(      shader_get_sampler_index( sh_post_ssao, "normal_buffer" ), surface_get_texture( normal_buffer ) );
texture_set_stage(      shader_get_sampler_index( sh_post_ssao, "noise_buffer" ),  surface_get_texture( global.SSAO_NOISE ) );
texture_set_repeat_ext( shader_get_sampler_index( sh_post_ssao, "noise_buffer" ), true ); 

shader_set_uniform_f(shader_get_uniform( sh_post_ssao, "uCameraNear"), obj_camera.cameraNear );
shader_set_uniform_f(shader_get_uniform( sh_post_ssao, "uCameraFar"),  obj_camera.cameraFar );

shader_set_uniform_f_array( shader_get_uniform( sh_post_ssao, "uInverseProjectionMatrix" ), matrix_inverse_projection );
shader_set_uniform_f_array( shader_get_uniform( sh_post_ssao, "uProjectionMatrix" ),        matrix_proj );

shader_set_uniform_f(       shader_get_uniform( sh_post_ssao,        "uScreenDimension"), view_wview[0], view_hview[0] );

shader_set_uniform_f_array( shader_get_uniform( sh_post_ssao,        "uSSAOKernel" ),    global.SSAO_KERNEL );
shader_set_uniform_f(       shader_get_uniform( sh_post_ssao,        "uSSAORadius"),     global.SSAO_RADIUS );
shader_set_uniform_f(       shader_get_uniform( sh_post_ssao,        "uSSAOStrength"),   global.SSAO_STRENGTH );
shader_set_uniform_f(       shader_get_uniform( sh_post_ssao,        "uSSAOPower"),      global.SSAO_POWER );

    draw_surface( ssao_buffer, 0, 0 );

surface_reset_target();
d3d_start();
