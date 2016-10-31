///scr_juju_ease_judder_in( t )

var degree = 3;
var t = clamp( argument0, 0, 1 ) * degree;
return ( scr_juju_ease_quad_inout( frac( t ) ) + floor( t ) ) / degree;

