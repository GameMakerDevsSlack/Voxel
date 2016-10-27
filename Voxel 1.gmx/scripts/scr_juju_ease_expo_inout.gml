///scr_juju_ease_expo_inout( t )

var t = argument0;

if ( t <= 0 ) return 0;
if ( t >= 1 ) return 1;

t *= 2;

if ( t < 1 ) {
    return 0.5 * power( 2, 10 * ( t - 1 ) );
} else {
    t--;
    return 1 - 0.5 * power( 2, -10 * t );
}

