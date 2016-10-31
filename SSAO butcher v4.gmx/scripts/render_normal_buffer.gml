///render_normal_buffer()

surface_set_target( normal_buffer );
draw_clear_alpha( c_white, 0 );

shader_set( shd_ssao_normal );
with( obj_camera ) event_user( 0 );
world_draw();
shader_reset();

surface_reset_target();
