/// render_normal_buffer()
/*
    This shader renders the view-space normals of your scene

*/




// Set the shader to the depth shader
shader_set(sh_normal);

// Set drawing target to depth buffer
surface_set_target( normal_buffer );

// Clear the depth buffer to full white
draw_clear_alpha( c_white, 0.0 );

{

    // Re set camera projection
    camera_set_projection();
    
    // Render 3d scene
    world_draw();

}

// Reset the drawing target
surface_reset_target();

// Reset shader
shader_reset();