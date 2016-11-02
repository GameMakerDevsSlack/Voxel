/// camera_draw()
/*
    This script draws the camera information of the SSAO on the game
*/




// Draw camera inforation
draw_set_color(c_black);
draw_text( 8, 192 + 00, "x: " + string(x));
draw_text( 8, 192 + 16, "y: " + string(y));
draw_text( 8, 192 + 32, "z: " + string(z));
draw_text( 8, 192 + 48, "yaw: " + string(yaw));
draw_text( 8, 192 + 64, "pitch: " + string(pitch));


if (global.displayFBO) {
    // Render normal buffer FBO
    draw_surface_ext( obj_ssao.normal_buffer, 0, 0, 0.25 / global.ssao_resolution, 0.25 / global.ssao_resolution, 0, c_white, 1 );
    draw_set_color(c_black);
    draw_text(8, 8, "Normal Buffer");
    
    // Render depth buffer FBO
    draw_surface_ext( obj_ssao.depth_buffer, 320, 0, 0.25 / global.ssao_resolution, 0.25 / global.ssao_resolution, 0, c_white, 1 );
    draw_set_color(c_black);
    draw_text(328, 8, "Linearized Depth Buffer");
    
    // Render diffuse buffer FBO
    draw_surface_ext( obj_ssao.diffuse_buffer, 640, 0, 0.25, 0.25, 0, c_white, 1 );
    draw_set_color(c_black);
    draw_text(648, 8, "Diffuse Buffer");
    
    // Render SSAO buffer FBO
    draw_surface_ext( obj_ssao.ssao_buffer, 960, 0, 0.25 / global.ssao_resolution, 0.25 / global.ssao_resolution, 0, c_white, 1 );
    draw_set_color(c_black);
    draw_text(968, 8, "SSAO Buffer");
} else {
    draw_text(8, 8, "Press <SPACE> to display off-screen FBOs");
}