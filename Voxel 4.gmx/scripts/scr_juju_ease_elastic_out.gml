///scr_juju_ease_elastic_out( t )

var t = argument0;
var p = 0.3;

if ( t <= 0 ) return 0;
if ( t >= 1 ) return 1;

return 1 + power( 2, -10 * t ) * sin( 2 * pi * ( t - p * 0.25 ) / p );

