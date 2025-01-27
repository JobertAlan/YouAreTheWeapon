// Store clicked state for each point
function create_map(x_, y_, width, height) {
    x_ = argument0;
    y_ = argument1;
    width = argument2;
    height = argument3;

    if (argument4 == undefined) var vertical = false else var vertical = argument4;
    if (argument5 == undefined) var nb_bubles = 75 else var nb_bubles = argument5;
    if (argument6 == undefined) var size_buble = [0.4, 0.75, 1] else var size_buble = argument6;
    if (argument7 == undefined) var spr_map = sPoints else var spr_map = argument7;
    if (argument8 == undefined) var depth_ = -100 else var depth_ = argument8;

    // Create map layers
    layer_create(depth_, "layer_manager");
    layer_create(depth_ + 1, "layer_particles");

    // Initialize variables
    global.nb_bubles_ = nb_bubles;
    global.width__ = width;
    global.height__ = height;
    global.size_buble_ = size_buble;
    global.spr_map_ = spr_map;
    global.vertical_ = vertical;

    // Create collision manager
    instance_create_layer(x_, y_, "layer_manager", obj_collision_manager);

    // Initialize the clicked state for each point
    global.clicked_points = array_create(nb_bubles, false); // Array to track clicked state
}