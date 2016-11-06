///scr_juju_ease_circle_out( t )

var t = argument0;
t = clamp( t, 0, 1 );

t--;

return sqrt( 1 - sqr( t ) );

