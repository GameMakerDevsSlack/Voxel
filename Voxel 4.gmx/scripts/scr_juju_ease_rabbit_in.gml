///scr_juju_ease_rabbit_in( t )

var degree = 4;
var t = clamp( argument0, 0, 1 ) * degree;
return ( scr_juju_ease_parabola_in( frac( t ) * 0.5 ) + floor( t ) ) / degree;

