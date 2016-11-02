///scr_juju_ease_quad_inout( t )

var t = argument0;
t *= 2;

if ( t < 1 ) {
    return 0.5 * t * t;
} else {
    t--;
    return -0.5 * ( t*(t-2) - 1 );
}

