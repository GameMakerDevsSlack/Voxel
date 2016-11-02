/// camera_draw()
/*
    This script draws the camera information of the SSAO on the game
*/



// Render the SSAO. This is where you finally visually see the SSAO.
if ( global.ssao_enable ) {
    // Set the drawing shader to the combining shader (combines DIFFUSE and SSAO)
    shader_set( sh_post_combine );
    
    // Send fragment uniforms (same order as in shader for readability)
    texture_set_stage(      shader_get_sampler_index( sh_post_combine, "diffuse_buffer" ),  surface_get_texture( diffuse_buffer ));
    texture_set_stage(      shader_get_sampler_index( sh_post_combine, "ssao_buffer" ),     surface_get_texture( ssao_buffer ));
    texture_set_interpolation_ext( shader_get_sampler_index( sh_post_combine, "ssao_buffer" ), true);
    
    draw_surface( diffuse_buffer, 0, 0 );
    
    // Reset to normal drawing
    shader_reset();
} else {
    draw_surface( diffuse_buffer, 0, 0 );
}




// Draw Debug Info
draw_set_color( c_black );
draw_set_alpha( 0.5 );
draw_roundrect( debugX, debugY - 54, debugX + debugWidth, debugY - 6, false );
draw_roundrect( debugX, debugY, debugX + debugWidth, debugY + debugHeight, false );

// FPS
draw_set_font( fnt_debug1 );
draw_set_alpha( 0.75 );
draw_set_color( c_white );
draw_text( debugX + 12, debugY - 54 + 4, "FPS:" );
draw_text( debugX + 12, debugY - 54 + 4 + 12, "FPS Real:" );
draw_text( debugX + 12, debugY - 54 + 4 + 24, "Frame(ms):" );
draw_set_color( c_yellow );
draw_text( debugX + 12 + 64, debugY - 54 + 4, string( fps ) );


fps_real_avg_cum += fps_real;
fps_real_count ++;
if( fps_real_count >= 60 ){
    fps_real_avg = fps_real_avg_cum/60;
    fps_real_avg_cum = 0;
    fps_real_count = 0;
}
draw_text( debugX + 12 + 64, debugY - 54 + 4 + 12, string( fps_real_avg ) );
draw_set_color( c_lime );
draw_text( debugX + 12 + 64, debugY - 54 + 4 + 24, string( 1000/(fps_real_avg+0.01) )+" ms" );