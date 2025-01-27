/*for (var i=0; i<n; i++) {
	draw_circle(node[i][0], node[i][1], node[i][2]/3, 1);
	//if (array_length(node[i][3]) > 0) {
	//	draw_line_width(node[i][0], node[i][1], node[node[i][3][0]][0], node[node[i][3][0]][1], 2);
	//}
	for (var j=0; j<array_length(node[i][3]); j++) {
		draw_line_width(node[i][0], node[i][1], node[node[i][3][j]][0], node[node[i][3][j]][1], 1);
	}
}


draw_set_color(c_green);

//draw_circle(node[green[0]][0], node[green[0]][1], node[green[0]][2]/3, 1);
for (var i=0; i<array_length(green); i++) {
	draw_circle(node[green[i]][0], node[green[i]][1], node[green[i]][2]/3, 0);
}

draw_set_color(c_red);

//draw_circle(node[red[0]][0], node[red[0]][1], node[red[0]][2]/3, 1);
for (var i=0; i<array_length(red); i++) {
	draw_circle(node[red[i]][0], node[red[i]][1], node[red[i]][2]/3, 0);
}

draw_set_color(c_blue);

for (var i=0; i<array_length(blue1); i++) {
	draw_circle(node[blue1[i]][0], node[blue1[i]][1], node[blue1[i]][2]/3, 0);
}
for (var i=0; i<array_length(blue2); i++) {
	draw_circle(node[blue2[i]][0], node[blue2[i]][1], node[blue2[i]][2]/3, 0);
}

draw_set_color(c_white);*/

//random_set_seed(541654964164964);
//for (var i=0; i<array_length(map); i++) {
//	for (var j=0; j<array_length(node[map[i]][3]); j++) {
//		draw_line_width(node[map[i]][0], node[map[i]][1], node[node[map[i]][3][j]][0], node[node[map[i]][3][j]][1], 1);
//	}
//	draw_sprite(sprite_index, choose(0,1,2), node[map[i]][0], node[map[i]][1]);
//}