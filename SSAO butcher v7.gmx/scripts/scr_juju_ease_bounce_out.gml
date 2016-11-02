///scr_juju_ease_bounce_out( t )

var t = argument0;

if ( t < 1 / 2.75 ) {
    return 7.5625 * sqr( t );
} else if ( t < 2 / 2.75 ) {
    t -= 1.5 / 2.75;
    return 7.5625* sqr( t ) + 0.75;
} else if ( t < 2.5 / 2.75 ) {
    t -= 2.25 / 2.75;
    return 7.5625 * sqr( t ) + 0.9375;
} else {
    t -= 2.625/2.75;
    return 7.5625 * sqr( t ) + 0.984375;
}

