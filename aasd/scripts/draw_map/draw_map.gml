// Draw the map
function draw_map() {
    if (instance_exists(oMap)) with (oMap) {
        random_set_seed(541654964164964); // Constant seed for consistent sprites

        for (var i = 0; i < array_length(map); i++) { // Iterate through each point
            // Get the point coordinates
            var node_x = node[map[i]][0];
            var node_y = node[map[i]][1];

            // Check for mouse click and update the clicked state
            if (mouse_check_button_pressed(mb_left)) {
                var mx = device_mouse_x_to_gui(0);
                var my = device_mouse_y_to_gui(0);

                // Check if the click is within the sprite bounds
                if (point_in_rectangle(mx, my, node_x - 16, node_y - 16, node_x + 16, node_y + 16)) {
                    global.clicked_points[i] = true; // Mark this point as clicked
                }
            }

            // Draw lines between neighbors
            for (var j = 0; j < array_length(node[map[i]][3]); j++) {
                draw_line_width(node[map[i]][0], node[map[i]][1], node[node[map[i]][3][j]][0], node[node[map[i]][3][j]][1], 1);
            }

            // Draw the point; change color if clicked
            if (global.clicked_points[i]) {
                draw_sprite_ext(sprite_index, choose(0, 1, 2), node_x, node_y, 1, 1, 0, c_red, 1);
            } else {
                draw_sprite(sprite_index, choose(0, 1, 2), node_x, node_y);
            }
        }
    }
}