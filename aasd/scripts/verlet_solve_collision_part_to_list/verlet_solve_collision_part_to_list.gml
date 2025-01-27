function verlet_solve_collision_part_to_list(argument0, argument1) {
	var part = argument0;
	var part_list = argument1;

	var num = ds_list_size(part_list);
	for(var i=0; i<num; i++){
	    var part_b = part_list[|i];
	    verlet_solve_collision_particles(part, part_b);
	}



}
