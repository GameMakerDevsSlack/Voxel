///scr_juju_ease_back_inout( t )

var t = argument0;

t *= 2;

if ( t < 1 ) {
    return 0.5 * t*t * ( 3.5949095 * t - 2.5949095 );
} else {
    t -= 2;
    return 0.5 * t*t * ( 3.5949095 * t + 2.5949095 ) + 1;
}

