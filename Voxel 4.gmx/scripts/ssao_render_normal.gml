///ssao_render_normal()

surface_set_target( ssao_srf_normal );
draw_clear_alpha( c_white, 0 );

shader_set( shd_ssao_normal );
with( obj_camera ) event_user( 0 );
draw_scene();
shader_reset();

surface_reset_target();
