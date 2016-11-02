///scr_juju_ease_judder_in_ext( t, repeats )

var t = clamp( argument0, 0, 1 ) * argument1;
return ( scr_juju_ease_cubic_inout( frac( t ) ) + floor( t ) ) / argument1;

