///ssao_render_depth()

surface_set_target( ssao_srf_depth );
draw_clear_alpha( c_white, 0.0 );

with( obj_camera ) event_user( 0 );
shader_set( shd_ssao_depth_linear );
shader_set_uniform_f(shader_get_uniform( shd_ssao_depth_linear, "uCameraFar"), obj_camera.camera_zfar );
shader_set_uniform_f(shader_get_uniform( shd_ssao_depth_linear, "uCameraNear"), obj_camera.camera_znear );
draw_scene();
shader_reset();

surface_reset_target();
