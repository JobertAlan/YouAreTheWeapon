/// @description particles + list

var num = ds_list_size(part_list);
for(var i=0; i<num; i++){
	var p = part_list[|i];
	with(p){
		instance_destroy();
	}
}

ds_list_destroy(part_list);