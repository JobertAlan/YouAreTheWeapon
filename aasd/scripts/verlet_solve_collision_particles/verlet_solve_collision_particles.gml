function verlet_solve_collision_particles(argument0, argument1) {
	var part_a = argument0;
	var part_b = argument1;

	var dx = part_b.x - part_a.x;
	var dy = part_b.y - part_a.y;
	var delta_length = sqrt(dx*dx+dy*dy);
	var rest_distance = part_a.radius + part_b.radius;
	if(delta_length < rest_distance && delta_length > 1){
	    var diff = (delta_length - rest_distance) / (delta_length*(part_a.inv_mass+part_b.inv_mass));
	    part_a.x += part_a.inv_mass * dx * diff;
	    part_a.y += part_a.inv_mass * dy * diff;
	    part_b.x -= part_b.inv_mass * dx * diff;
	    part_b.y -= part_b.inv_mass * dy * diff;
	}



}
