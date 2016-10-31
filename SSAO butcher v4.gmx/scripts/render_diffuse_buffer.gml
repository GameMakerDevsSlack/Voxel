///render_diffuse_buffer()

surface_set_target( diffuse_buffer );
draw_clear( c_white );

if ( global.DIFFUSE_ENABLE ) {
    with( obj_camera ) event_user( 0 );
    world_draw();
}

surface_reset_target();
