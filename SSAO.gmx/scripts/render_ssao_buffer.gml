/// render_ssao_buffer()
/*
    This shader combines the depth and normal buffers
    to calculate an approximation of Ambient Occlusion
*/




// Start orthographic projection (SSAO IS POST PROCESS)
d3d_set_projection_ortho( 0, 0, view_wview[0], view_hview[0], 0 );

// Disable 3d because gamemaker likes to fuck with our 3d axes >:[
d3d_end();

// Set drawing target to ssao buffer
surface_set_target( ssao_buffer );

// Clear the ssao buffer to full white
draw_clear_alpha( c_white, 0.0 );

// Set the shader to the ssao shader
shader_set( sh_post_ssao );

texture_set_repeat(false);

{   
 
    // Send fragment uniforms (same order as in shader for readability)
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
    
    // Draw a blank quad for the ssao to be rendered on
    draw_surface( ssao_buffer, 0, 0 );
    
}            
            
            
// Reset the drawing target
surface_reset_target();

// Re-enable 3d
d3d_start();
