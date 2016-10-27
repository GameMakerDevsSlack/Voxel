///scr_juju_ease_bounce_inout( t )

var t = argument0;

if ( t < 0.5 ) {
    return scr_juju_ease_bounce_in( t * 2 ) * 0.5;
} else {
    return scr_juju_ease_bounce_out( t * 2 -1 ) * 0.5 + 0.5;
}

