///scr_juju_ease_circle_in( t )

var t = argument0;
t = clamp( t, 0, 1 );

return 1 - sqrt( 1 - sqr( t ) );

