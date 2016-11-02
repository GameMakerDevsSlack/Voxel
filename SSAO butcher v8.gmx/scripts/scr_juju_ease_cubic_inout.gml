///scr_juju_ease_cubic_inout( t )

var t = argument0;
t *= 2;

if ( t < 1 ) {
    return 0.5 * t*t*t;
} else {
    t -= 2;
    return 0.5 * ( t*t*t + 2 );
}

