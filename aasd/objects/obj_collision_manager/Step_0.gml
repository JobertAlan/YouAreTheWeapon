/// @description update particles + constrain in room 
//var num = ds_list_size(part_list);
//if(num > max_particles){
//	var diff = num - max_particles;
//	repeat(diff){
//		var p = part_list[|0];
//		with(p){
//			instance_destroy();
//		}
//		ds_list_delete(part_list, 0);
//	}
//}

verlet_part_list_constrain_in_bounds(part_list, x, y, w, h);
verlet_solve_collisions_in_list(part_list);