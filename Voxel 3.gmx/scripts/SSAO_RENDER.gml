/// SSAO_RENDER()
/*
    This script renders all the requires scenes to the appropriate SSAO buffers
*/


d3d_start();
d3d_set_lighting( false );

// set camera projection
if( !is_array(matrix_proj) ){
    
    with( obj_camera ) event_user( 1 );
    
    // Store inverse projection matrix for SSAO shader
    // NEEDS to be called after the projection
    matrix_proj               = matrix_get( matrix_projection );
    matrix_inverse_projection = InverseMatrix4( matrix_proj );
}


///////////////////////////////////
///////// RENDER TO FBO ///////////
///////////////////////////////////
draw_enable_alphablend( false );
render_diffuse_buffer();
render_normal_buffer();
render_depth_buffer();
render_ssao_buffer();
render_blur_ssao();
draw_enable_alphablend( true );
