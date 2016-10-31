///scr_voxel_load( file, vertex format )
//Copyright - Julian Adams @jujuadams 26th Oct 2016

var _file = argument0;
var _vft = argument1;

_buffer = buffer_load( _file );

var _str = "";
repeat( 4 ) _str += chr( buffer_read( _buffer, buffer_u8 ) );

if ( _str != "VOX " ) {
    buffer_delete( _buffer );
    exit;
}

var _vbuff = vertex_create_buffer();
vertex_begin( _vbuff, _vft );

var _size = buffer_get_size( _buffer );
while( buffer_tell( _buffer ) < _size ) {
    
    var _str = "";
    repeat( 4 ) _str += chr( buffer_read( _buffer, buffer_u8 ) );
    
    if ( _str == "SIZE" ) {
        
        var _content_size = buffer_read( _buffer, buffer_u32 );
        var _children_size = buffer_read( _buffer, buffer_u32 );
        
        voxel_size_x = buffer_read( _buffer, buffer_u32 );
        voxel_size_y = buffer_read( _buffer, buffer_u32 );
        voxel_size_z = buffer_read( _buffer, buffer_u32 );
        
        show_debug_message( "x size = " + string( voxel_size_x ) );
        show_debug_message( "y size = " + string( voxel_size_y ) );
        show_debug_message( "z size = " + string( voxel_size_z ) );
        
    } else if ( _str == "XYZI" ) {
        
        var _content_size = buffer_read( _buffer, buffer_u32 );
        var _children_size = buffer_read( _buffer, buffer_u32 );
        
        var _number_of_voxels = buffer_read( _buffer, buffer_u32 );
        
        repeat( _number_of_voxels ) {
            
            var _x = buffer_read( _buffer, buffer_u8 );
            var _y = buffer_read( _buffer, buffer_u8 );
            var _z = buffer_read( _buffer, buffer_u8 );
            var _i = buffer_read( _buffer, buffer_u8 );
            
            var _colour = global.voxel_palette[_i] & c_white;
            var _alpha = ( global.voxel_palette[_i] >> 24 ) & 255;
            
            vertex_position_3d( _vbuff, _x  , _y  , _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0, -1,  0 ); //top
            vertex_position_3d( _vbuff, _x+1, _y  , _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0, -1,  0 );
            vertex_position_3d( _vbuff, _x+1, _y  , _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0, -1,  0 );
            vertex_position_3d( _vbuff, _x  , _y  , _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0, -1,  0 );
            vertex_position_3d( _vbuff, _x+1, _y  , _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0, -1,  0 );
            vertex_position_3d( _vbuff, _x  , _y  , _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0, -1,  0 );
            
            vertex_position_3d( _vbuff, _x+1, _y  , _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  1,  0,  0 ); //right
            vertex_position_3d( _vbuff, _x+1, _y+1, _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  1,  0,  0 );
            vertex_position_3d( _vbuff, _x+1, _y+1, _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  1,  0,  0 );
            vertex_position_3d( _vbuff, _x+1, _y  , _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  1,  0,  0 );
            vertex_position_3d( _vbuff, _x+1, _y+1, _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  1,  0,  0 );
            vertex_position_3d( _vbuff, _x+1, _y  , _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  1,  0,  0 );
            
            vertex_position_3d( _vbuff, _x+1, _y+1, _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  1,  0 ); //bottom
            vertex_position_3d( _vbuff, _x  , _y+1, _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  1,  0 );
            vertex_position_3d( _vbuff, _x  , _y+1, _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  1,  0 );
            vertex_position_3d( _vbuff, _x+1, _y+1, _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  1,  0 );
            vertex_position_3d( _vbuff, _x  , _y+1, _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  1,  0 );
            vertex_position_3d( _vbuff, _x+1, _y+1, _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  1,  0 );
            
            vertex_position_3d( _vbuff, _x  , _y+1, _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, -1,  0,  0 ); //left
            vertex_position_3d( _vbuff, _x  , _y  , _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, -1,  0,  0 );
            vertex_position_3d( _vbuff, _x  , _y  , _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, -1,  0,  0 );
            vertex_position_3d( _vbuff, _x  , _y+1, _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, -1,  0,  0 );
            vertex_position_3d( _vbuff, _x  , _y  , _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, -1,  0,  0 );
            vertex_position_3d( _vbuff, _x  , _y+1, _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, -1,  0,  0 );
            
            vertex_position_3d( _vbuff, _x  , _y  , _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0, -1 ); //under
            vertex_position_3d( _vbuff, _x+1, _y+1, _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0, -1 );
            vertex_position_3d( _vbuff, _x+1, _y  , _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0, -1 );
            vertex_position_3d( _vbuff, _x+1, _y+1, _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0, -1 );
            vertex_position_3d( _vbuff, _x  , _y  , _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0, -1 );
            vertex_position_3d( _vbuff, _x  , _y+1, _z   ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0, -1 );
            
            vertex_position_3d( _vbuff, _x  , _y  , _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0,  1 ); //over
            vertex_position_3d( _vbuff, _x+1, _y  , _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0,  1 );
            vertex_position_3d( _vbuff, _x+1, _y+1, _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0,  1 );
            vertex_position_3d( _vbuff, _x+1, _y+1, _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0,  1 );
            vertex_position_3d( _vbuff, _x  , _y+1, _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0,  1 );
            vertex_position_3d( _vbuff, _x  , _y  , _z+1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff,  0,  0,  1 );
            
            global.triangles += 12;
            global.cubes += 1;
            
        }
        
    }
    
}

vertex_end( _vbuff );
buffer_delete( _buffer );

return _vbuff;
