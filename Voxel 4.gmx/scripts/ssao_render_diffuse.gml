///ssao_render_diffuse()

surface_set_target( srf_diffuse );
draw_clear( background_colour );
with( obj_camera ) event_user( 0 );
draw_scene();
surface_reset_target();
