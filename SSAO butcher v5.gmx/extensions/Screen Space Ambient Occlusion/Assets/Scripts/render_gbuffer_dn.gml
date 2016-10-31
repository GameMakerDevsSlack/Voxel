/// render_gbuffer_dn()

surface_set_target_ext( 0, depth_buffer );
surface_set_target_ext( 1, normal_buffer );

// Clear the depth buffer to full white
draw_clear_alpha( c_white, 1.0 );

    // Set shader
    shader_set( sh_gbuffer_dn );

    // Send uniforms
    shader_set_uniform_f(shader_get_uniform( sh_gbuffer_dn, "uCameraFar"), obj_camera.cameraFar );
    shader_set_uniform_f(shader_get_uniform( sh_gbuffer_dn, "uCameraNear"), obj_camera.cameraNear );
    
        // Re set camera projection
        camera_set_projection();
        
        // Render 3d scene
        world_draw();

    // Reset shader
    shader_reset();
    
// Reset the drawing target
surface_reset_target();

