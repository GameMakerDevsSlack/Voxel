///render_gbuffer_ddn()

if ( global.DIFFUSE_ENABLE ) surface_set_target_ext( 0, diffuse_buffer ); 
surface_set_target_ext( 1, depth_buffer );
surface_set_target_ext( 2, normal_buffer );
draw_clear( c_white );

with( obj_camera ) event_user( 0 );
shader_set( sh_gbuffer_ddn );
shader_set_uniform_f( shader_get_uniform( sh_gbuffer_ddn, "uCameraFar"  ), obj_camera.cameraFar  );
shader_set_uniform_f( shader_get_uniform( sh_gbuffer_ddn, "uCameraNear" ), obj_camera.cameraNear );

world_draw();

shader_reset();
surface_reset_target();
