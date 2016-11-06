///scr_juju_ease_quint_inout( t )

var t = clamp( argument0, 0, 1 );
t *= 2;

if ( t < 1 ) {
    return 0.5 * t*t*t*t*t;
} else {
    t -= 2;
    return 0.5 * ( t*t*t*t*t + 2 );
}

