function verlet_part_set_mass(argument0, argument1) {
	var part = argument0;
	part.prev_mass = part.mass;
	part.mass = argument1;
	if(part.mass > 0){
	    part.inv_mass = 1 / part.mass;
	} else {
	    part.mass = 0;
	    part.inv_mass = 0;
	}



}
