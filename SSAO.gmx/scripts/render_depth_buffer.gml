/// render_depth_buffer()
/*
    This shader renders the the scene where each vertex is stored
    as a distance to the camera
*/




// Set the shader to the depth shader
shader_set( sh_depth );

// Set drawing target to depth buffer
surface_set_target( depth_buffer );

// Clear the depth buffer to full white
draw_clear_alpha( c_white, 0.0 );

{

    // Send uniforms
    shader_set_uniform_f(shader_get_uniform( sh_depth, "uCameraFar"), obj_camera.cameraFar );
    shader_set_uniform_f(shader_get_uniform( sh_depth, "uCameraNear"), obj_camera.cameraNear );
    
    // Re set camera projection
    camera_set_projection();
    
    // Render 3d scene
    world_draw();

}

// Reset the drawing target
surface_reset_target();

// Reset shader
shader_reset();
