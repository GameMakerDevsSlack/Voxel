/// camera_draw()
/*
    This script draws the camera information of the SSAO on the game
*/



// Render the SSAO. This is where you finally visually see the SSAO.
/*if ( global.SSAO_ENABLE ) {
    // Set the drawing shader to the combining shader (combines DIFFUSE and SSAO)
    shader_set( sh_post_combine );
    
    // Send fragment uniforms (same order as in shader for readability)
    texture_set_stage(      shader_get_sampler_index( sh_post_combine, "diffuse_buffer" ),  surface_get_texture( diffuse_buffer ));
    texture_set_stage(      shader_get_sampler_index( sh_post_combine, "ssao_buffer" ),     surface_get_texture( ssao_buffer ));
    texture_set_interpolation_ext( shader_get_sampler_index( sh_post_combine, "ssao_buffer" ), true);
    
    draw_surface( diffuse_buffer, 0, 0 );
    
    // Reset to normal drawing
    shader_reset();
} else*/ {
//    draw_surface( diffuse_buffer, 0, 0 );
    draw_scene();
}

