function verlet_part_instance_update() {
	var delta = delta_time * micros_to_seconds; 

	//if(life > 0){
	//    life -= delta;
	//    if(life <= 0){
	//        instance_destroy();
	//    }
	//}

	var temp_x = x;
	var temp_y = y;

	x += (x-prev_pos_x) * drag + forces_x * inv_mass * delta * delta;
	y += (y-prev_pos_y) * drag + forces_y * inv_mass * delta * delta;
	prev_pos_x = temp_x;
	prev_pos_y = temp_y;
	forces_x = 0;
	forces_y = 0;
}
