/// render_diffuse_buffer()
/*
    This shader renders the base-textured scene.
    
*/



// Set the shader to the diffuse shader
shader_set( sh_diffuse );

// Set drawing target to depth buffer
surface_set_target( diffuse_buffer );

// Clear the depth buffer to full white
draw_clear_alpha( c_white, 1.0 );

if ( !keyboard_check( vk_f1 ) ) and (global.DIFFUSE_ENABLE) {
    
    // Re set camera projection
    camera_set_projection();
    
    // Render 3d scene
    world_draw();

}

// Reset the drawing target
surface_reset_target();

// Reset shader
shader_reset();
