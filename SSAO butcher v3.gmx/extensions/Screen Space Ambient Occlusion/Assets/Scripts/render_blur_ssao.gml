/// render_blur_ssao()
/*
    This blur is a modified bilateral gaussian blur method.
    It uses two passes. One for horizontal blur, and the other for vertical blur.
    In addition to direction-based blurring, it also samples the depth map to prevent blurring into areas where it shouldnt
*/
 
 
 
// Start orthographic projection (SSAO IS POST PROCESS)
d3d_set_projection_ortho( 0, 0, view_wview[0], view_hview[0], 0 );
 
// Disable 3d because gamemaker likes to fuck with our 3d axes >:[
d3d_end();
 
shader_set( sh_post_ssao_blur );
 
// Set uniforms
texture_set_stage( shader_get_sampler_index( sh_post_ssao_blur, "depth_buffer" ),   surface_get_texture( depth_buffer ) );
texture_set_stage( shader_get_sampler_index( sh_post_ssao_blur, "normal_buffer" ),  surface_get_texture( normal_buffer ) );
shader_set_uniform_f( shader_get_uniform( sh_post_ssao_blur, "uSSAOResolution"),   global.SSAO_RESOLUTION );
shader_set_uniform_f( shader_get_uniform( sh_post_ssao_blur, "uScreenResolution"), view_wview[0], view_hview[0] );
 
 
for( var i = 0; i < global.SSAO_BLUR_PASSES; i++ ) {
    // Horizontal Blur
    surface_set_target( ssao_buffer_temp );
        shader_set_uniform_f( shader_get_uniform( sh_post_ssao_blur, "uPixelCheck"),       1.0,           0.0 );
        draw_surface( ssao_buffer, 0, 0 );
    surface_reset_target();
   
    // Vertical Blur
    surface_set_target( ssao_buffer );
        shader_set_uniform_f( shader_get_uniform( sh_post_ssao_blur, "uPixelCheck"),       0.0,           1.0 );
        draw_surface( ssao_buffer_temp, 0, 0 );
    surface_reset_target();
   
}
shader_reset();
 
// Re-enable 3d
d3d_start();