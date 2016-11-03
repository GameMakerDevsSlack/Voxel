///render_diffuse_buffer()

surface_set_target( diffuse_buffer );
draw_clear( background_colour );
with( obj_camera ) event_user( 0 );
draw_scene();
surface_reset_target();
