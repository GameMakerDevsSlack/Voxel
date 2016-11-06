///render_hlsl()

surface_set_target_ext( 0, srf_diffuse ); 
surface_set_target_ext( 1, ssao_srf_depth );
surface_set_target_ext( 2, ssao_srf_normal );
draw_clear( c_white );

with( obj_camera ) event_user( 0 );
shader_set( shd_ssao_hlsl );
shader_set_uniform_f( shader_get_uniform( shd_ssao_hlsl, "uCameraFar"  ), obj_camera.camera_zfar  );
shader_set_uniform_f( shader_get_uniform( shd_ssao_hlsl, "uCameraNear" ), obj_camera.camera_znear );

draw_scene();

shader_reset();
surface_reset_target();
