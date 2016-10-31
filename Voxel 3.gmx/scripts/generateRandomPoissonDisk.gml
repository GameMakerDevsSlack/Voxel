var array; // THIS IS OBVIOUSLY AN ARRAY.

for( var i = 0; i < argument0; i+=1 ){
    var _x, _y, _z;
    _x = random( 2.0 ) - 1.0;
    _y = random( 2.0 ) - 1.0;
    
    var mag = sqrt(( _x * _x ) + ( _y * _y ));
    
    // Normalize
    _x /= mag;
    _y /= mag;
    
    // exponentiate scale
    var scale = i / argument0;
    scale = lerp( 0.1, 1.0, scale*scale );
    _x *= scale;
    _y *= scale;
    
    // set to value
    array[i * 2 + 0]    = _x;
    array[i * 2 + 1]    = _y;
}
return array;
