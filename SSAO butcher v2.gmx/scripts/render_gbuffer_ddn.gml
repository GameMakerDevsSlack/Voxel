/// render_gbuffer_ddn()

// Set shader

// Set render targets
if ( global.DIFFUSE_ENABLE ) {
    surface_set_target_ext( 0, diffuse_buffer );
} 
surface_set_target_ext( 1, depth_buffer );
surface_set_target_ext( 2, normal_buffer );

// Clear the depth buffer to full white
draw_clear_alpha( c_white, 1.0 );



    // Set shader
    shader_set( sh_gbuffer_ddn );

    // Send uniforms
    shader_set_uniform_f(shader_get_uniform( sh_gbuffer_ddn, "uCameraFar"), obj_camera.cameraFar );
    shader_set_uniform_f(shader_get_uniform( sh_gbuffer_ddn, "uCameraNear"), obj_camera.cameraNear );
    
        // Re set camera projection
        camera_set_projection();
        
        // Render 3d scene
        world_draw();

    // Reset shader
    shader_reset();
    
// Reset the drawing target
surface_reset_target();
