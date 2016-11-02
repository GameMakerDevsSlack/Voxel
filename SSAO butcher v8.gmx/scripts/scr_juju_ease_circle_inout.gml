///scr_juju_ease_circle_inout( t )

var t = argument0;
t = clamp( t, 0, 1 );

t *= 2;

if ( t < 1 ) {
    return 0.5 * ( 1 - sqrt( 1 - sqr( t ) ) );
} else {
    t -= 2;
    return 0.5 * ( sqrt( 1 - sqr( t ) ) + 1 );
}

