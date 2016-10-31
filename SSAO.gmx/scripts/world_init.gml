for( var i=0; i < 15; i++ ){
    global.mapmodels[i] = d3d_model_create();
    d3d_model_load( global.mapmodels[i], string(i)+".d3d" );
}
