///render_hlsl()

if ( global.DIFFUSE_ENABLE ) surface_set_target_ext( 0, diffuse_buffer ); 
surface_set_target_ext( 1, depth_buffer );
surface_set_target_ext( 2, normal_buffer );
draw_clear( c_white );

with( obj_camera ) event_user( 1 );
shader_set( shd_ssao_hlsl );
shader_set_uniform_f( shader_get_uniform( shd_ssao_hlsl, "uCameraFar"  ), obj_camera.zfar  );
shader_set_uniform_f( shader_get_uniform( shd_ssao_hlsl, "uCameraNear" ), obj_camera.znear );

draw_scene();

shader_reset();
surface_reset_target();
