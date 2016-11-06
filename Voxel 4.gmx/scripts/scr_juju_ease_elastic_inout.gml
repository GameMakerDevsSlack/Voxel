///scr_juju_ease_elastic_inout( t )

var t = argument0 * 2
var p = 0.45;

if ( t <= 0 ) return 0;
if ( t >= 2 ) return 1;

t--;
if ( t < 0 ) {
    return -0.5 * power( 2, 10 * t ) * sin( 2 * pi * ( t - p * 0.25 ) / p );
} else {
    return 1 + 0.5 * power( 2, -10 * t ) * sin( 2 * pi * ( t - p * 0.25 ) / p );
}

