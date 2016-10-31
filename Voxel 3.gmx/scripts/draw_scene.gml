///draw_scene()

draw_set_colour( c_red );
d3d_draw_block( 0, 0, -room_height,
                room_width, room_height, 0,
                background_get_texture( bck_blank ), 1, 1 );
draw_set_colour( c_white );

with( obj_pot ) event_user( 0 );
