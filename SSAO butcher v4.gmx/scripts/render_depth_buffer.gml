///render_depth_buffer()

surface_set_target( depth_buffer );
draw_clear_alpha( c_white, 0.0 );

with( obj_camera ) event_user( 0 );
shader_set( shd_ssao_depth_linear );
shader_set_uniform_f(shader_get_uniform( shd_ssao_depth_linear, "uCameraFar"), obj_camera.cameraFar );
shader_set_uniform_f(shader_get_uniform( shd_ssao_depth_linear, "uCameraNear"), obj_camera.cameraNear );
world_draw();
shader_reset();

surface_reset_target();
