/// @description Draw the map

// One script too !!!
// wow, my life is perfect now
draw_map();

// Edit this script to edit the visuals



// Want to get access to each points ?
// The points are stored in the oMap object
// - node   :   has every points variables [x, y, radius, [neighbours]]
// - map    :   has all the good points number

// Exemple :
// You wanna access the point that is under the mouse and draw a circle on it ?

if (instance_exists(oMap)) {
	if (oMap.done == true) {
		
		var node_ = oMap.node;
		var map_ = oMap.map;
	
		var closest_point = [0, point_distance(mouse_x, mouse_y, node_[map_[0]][0], node_[map_[0]][1])];
		for (var i=1; i<array_length(map_); i++) {
			var dist = point_distance(mouse_x, mouse_y, node_[map_[i]][0], node_[map_[i]][1]);
			if (dist < closest_point[1]) {
				closest_point = [map_[i], dist];
			}
		}
	
		draw_circle(node_[closest_point[0]][0], node_[closest_point[0]][1], 20, true);
		
	}
}
