/// Yes

n = instance_number(obj_particle);
node= array_create(n, 0);

w=obj_collision_manager.w;
h=obj_collision_manager.h;
side_vertical = global.vertical_;

done = false;

var best_y = [0,h];
var best_y2=[0,h];

for (var i=0; i<n; i++) {
	var inst = instance_find(obj_particle,i);
	node[i] = [inst.x, inst.y, inst.radius, []]; // x, y, rayon et liste des copains
	if (node[i][1] < best_y[1]) {
		best_y2 = best_y;
		best_y = [i, node[i][1]];
	}else if (node[i][1] < best_y2[1]) best_y2 = [i, node[i][1]];
}

if (side_vertical == true) {
	for(var i=0; i<array_length(node); i++) {
		var temp_x = node[i][0];
		node[i][0] = node[i][1];
		node[i][1] = temp_x;
	}
}

/// Bye bye le monde physique
instance_destroy(obj_collision_manager);
instance_destroy(obj_particle);

/// Donc là on a nos bulles stables, maintenant plus qu'à les relier
// Pour cela on va dire que chaque bulle est liée à 5 voisines
// MAIS, si la voisine est > 100 pixels de distance de la bulle, elles sont plus voisines

for (var i=0; i<n; i++) {
	var liste_friend = []
	for (var j=0; j<n; j++) {
		if (i != j and point_distance(node[i][0], node[i][1], node[j][0], node[j][1]) < 1.1*(node[i][2]+node[j][2])) {
			array_push(liste_friend, j);
		}
	}
	//array_sort(liste_friend, true);
	//TEST 1 ligne :    if (array_length(liste_friend) > 0) node[i][3] = [liste_friend[0]];
	//for (var j=0; j<array_length(liste_friend); j++) {
	//	array_push(node[i][3], liste_friend[j]);
	//}
	node[i][3] = liste_friend;
}

//show_debug_message(node);

/// Maintenant trions un peu tout ça !
// Les lignes verticales :
// -Partent des deux plus hauts nodes
// -Descendent avec ce patern :
//         - Regarde ses copains
//         - Prend le copain le plus bas et descend vers lui

green = [best_y[0]];
red = [best_y2[0]];

var out = false;
var current_node = best_y[0];

while (out == false) {
	var voisin = node[current_node][3]; // On récupère tout les voisins;
	var good_voisin = [];
	for (var i=0; i<array_length(voisin); i++) {
		if (node[voisin[i]][1] > node[current_node][1]) {
			array_push(good_voisin, voisin[i]);
		}
	}
	if (array_length(good_voisin) > 0) {
		current_node = good_voisin[irandom_range(0, array_length(good_voisin)-1)]
		array_push(green, current_node);
	}else{
		out = true;
	}
	//var lowest_y = [current_node, node[current_node][1]];
	//for (var i=0; i<array_length(voisin); i++) {
	//	if (node[voisin[i]][1] > lowest_y[1]) {
	//		lowest_y = [voisin[i], node[voisin[i]][1]];
	//	}
	//}
	
	//if (lowest_y[0] != green[array_length(green)-1]) {
	//	array_push(green, lowest_y[0]);
	//	current_node = lowest_y[0];
	//}else{
	//	out = true;
	//}
}

out = false;
current_node = best_y2[0];

while (out == false) {
	var voisin = node[current_node][3]; // On récupère tout les voisins;
	var voisin = node[current_node][3]; // On récupère tout les voisins;
	var good_voisin = [];
	for (var i=0; i<array_length(voisin); i++) {
		if (node[voisin[i]][1] > node[current_node][1]) {
			array_push(good_voisin, voisin[i]);
		}
	}
	if (array_length(good_voisin) > 0) {
		current_node = good_voisin[irandom_range(0, array_length(good_voisin)-1)]
		array_push(red, current_node);
	}else{
		out = true;
	}
	//var lowest_y = [current_node, node[current_node][1]];
	//for (var i=0; i<array_length(voisin); i++) {
	//	if (node[voisin[i]][1] > lowest_y[1]) {
	//		lowest_y = [voisin[i], node[voisin[i]][1]];
	//	}
	//}
	
	//if (lowest_y[0] != red[array_length(red)-1]) {
	//	array_push(red, lowest_y[0]);
	//	current_node = lowest_y[0];
	//}else{
	//	out = true;
	//}
}

blue1 = [green[irandom_range(0, array_length(green)-1)]];
blue2 = [red[irandom_range(0, array_length(red)-1)]];

out = false;
current_node = blue1[0];
var side = "left";
if (node[current_node][0] < (w-x)/2) side = "right"; // Direction vers laquel il se dirige

while (out == false) {
	var voisin = node[current_node][3];
	var good_voisin = [];
	for (var i=0; i<array_length(voisin); i++) {
		if (node[voisin[i]][0] < node[current_node][0]) {
			if (side == "left") {
				array_push(good_voisin, voisin[i]);
			}
		}else{
			if (side == "right") {
				array_push(good_voisin, voisin[i]);
			}
		}
	}
	if (array_length(good_voisin) > 0) {
		current_node = good_voisin[irandom_range(0, array_length(good_voisin)-1)]
		array_push(blue1, current_node);
	}else{
		out = true;
	}
}

/// Second blue
out = false;
current_node = blue2[0];
var side = "left";
if (node[current_node][0] < (w-x)/2) side = "right"; // Direction vers laquel il se dirige

while (out == false) {
	var voisin = node[current_node][3];
	var good_voisin = [];
	for (var i=0; i<array_length(voisin); i++) {
		if (node[voisin[i]][0] < node[current_node][0]) {
			if (side == "left") {
				array_push(good_voisin, voisin[i]);
			}
		}else{
			if (side == "right") {
				array_push(good_voisin, voisin[i]);
			}
		}
	}
	if (array_length(good_voisin) > 0) {
		current_node = good_voisin[irandom_range(0, array_length(good_voisin)-1)]
		array_push(blue2, current_node);
	}else{
		out = true;
	}
}

map = [green[0]];
// Green
for (var i=0; i<array_length(green); i++) {
	var add_ = true;
	for (var j=0; j<array_length(map); j++) {
		if (green[i] == map[j]) {
			add_ = false;
		}
	}
	if (add_ == true) {
		array_push(map, green[i]);
	}
}
// Red
for (var i=0; i<array_length(red); i++) {
	var add_ = true;
	for (var j=0; j<array_length(map); j++) {
		if (red[i] == map[j]) {
			add_ = false;
		}
	}
	if (add_ == true) {
		array_push(map, red[i]);
	}
}
// Blue1
for (var i=0; i<array_length(blue1); i++) {
	var add_ = true;
	for (var j=0; j<array_length(map); j++) {
		if (blue1[i] == map[j]) {
			add_ = false;
		}
	}
	if (add_ == true) {
		array_push(map, blue1[i]);
	}
}
// Blue2
for (var i=0; i<array_length(blue2); i++) {
	var add_ = true;
	for (var j=0; j<array_length(map); j++) {
		if (blue2[i] == map[j]) {
			add_ = false;
		}
	}
	if (add_ == true) {
		array_push(map, blue2[i]);
	}
}


// Update the good neighbors
for (var i=0; i<array_length(map); i++) {
	var voisin = node[map[i]][3];
	node[map[i]][3] = [];
	for (var j=0; j<array_length(voisin); j++) {
		for (var k=0; k<array_length(map); k++) {
			if (map[k] == voisin[j]) array_push(node[map[i]][3], voisin[j]);
		} 
	}
}

if (side_vertical == true) {
	for(var i=0; i<array_length(node); i++) {
		var temp_x = node[i][0];
		node[i][0] = node[i][1];
		node[i][1] = temp_x;
	}
}

done = true;