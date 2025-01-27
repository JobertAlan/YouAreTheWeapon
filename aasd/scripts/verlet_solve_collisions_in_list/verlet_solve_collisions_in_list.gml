function verlet_solve_collisions_in_list(argument0) {
	var list = argument0;
	var num = ds_list_size(list);
	for(var i=0; i<num-1; i++){
	    var part_a = list[|i];
	    for(var j=i+1; j<num; j++){
	        var part_b = list[|j];
	        verlet_solve_collision_particles(part_a, part_b);
	    }
	}



}
