/// generateFBO()
/*
    Generate FBOs used for the SSAO shader
    I realise that FBO is an OpenGL term, and Game Maker doesn't use OpenGL.
    But I learned GLSL through OpenGL, so suck it <3
*/



//
//
// These are rendered at full resolution as they need to be precise
depth_buffer      = surface_create( view_wview[0] * global.SSAO_RESOLUTION, view_hview[0] * global.SSAO_RESOLUTION );
normal_buffer     = surface_create( view_wview[0] * global.SSAO_RESOLUTION, view_hview[0] * global.SSAO_RESOLUTION );
ssao_buffer       = surface_create( view_wview[0] * global.SSAO_RESOLUTION, view_hview[0] * global.SSAO_RESOLUTION );
ssao_buffer_temp  = surface_create( view_wview[0] * global.SSAO_RESOLUTION, view_hview[0] * global.SSAO_RESOLUTION );
//
//
// Diffuse is rendered at screen resolution to prevent pixel loss
diffuse_buffer    = surface_create( view_wview[0], view_hview[0]);
//