///render_diffuse_buffer()

surface_set_target( diffuse_buffer );
draw_clear_alpha( background_colour, 1 );

with( obj_camera ) event_user( 1 );
draw_scene();

surface_reset_target();
