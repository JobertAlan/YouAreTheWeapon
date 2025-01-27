/// @description update verlet_part
//apply gravity force

//calc gravity forces x/y
var fx = 0;
var fy = gravity_force * mass;

verlet_part_apply_force(self, fx, fy); //apply gravity force

verlet_part_instance_update(); //update particle