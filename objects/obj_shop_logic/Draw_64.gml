 ///@description Draw Shop

draw_set_color(c_black);

for (var i = 0; i < ds_list_size(global.inv); i ++) {
	
	var val = ds_list_find_value(global.inv, i);
	draw_text(16, 16, string(val));
	y += 16;
	
}

if (!shopOpen) exit;

//Set Shop Attributes
draw_set_color(c_black);
	draw_set_alpha(0.5);
		draw_rectangle(0, 0, guiWidth, guiHeight, 0);
	draw_set_alpha(0.8);
		draw_rectangle(menuMargin, 0, menuMargin + menuWidth, guiHeight, 0);
	draw_set_alpha(1);
draw_set_color(c_white);

//Draw Menu Items
for (var i = 0; i < itemCount; i ++) {
	
	//Get Item
	var arr = items[| i];
	var item = arr[0];
	
	//Set Position
	var _x = menuMargin + menuWidth/2;
	var _y = (guiHeight/2) + (i - selected) * 32;
	
	//Set Scale
	var s = 1;
	if (i == selected) item = "> " + item + " <";
	
	//Draw Item
	draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
			draw_text_transformed(_x, _y, item, s, s, 0);
		draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
}

//Get Preview Data
var arr = items[| selected];
var item = arr[0];
var price = arr[1];
var desc = arr[2];

//Set Position
var _x = (menuMargin + menuWidth) + previewWidth/2;
var _y = (guiHeight/2);

//Draw Preview Sprite

var spr = asset_get_index("spr_" + item);

if (sprite_exists(spr)) {
	
	var s = 2;
	draw_sprite_ext(spr, 0, _x, _y, s, s, 0, -1, 1);
	
}

draw_set_color(c_black);
draw_set_valign(fa_bottom);
	draw_text(menuMargin +menuWidth + 4, guiHeight/14, "Money: $" + string(global.money));
	
//Draw Description
draw_set_halign(fa_center);       
	draw_text(_x, _y + 80, desc);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


//Draw Price
draw_set_valign(fa_bottom);
	draw_text(menuMargin +menuWidth + 4, guiHeight - 4, "Price: $" + string(price));
	
	draw_set_halign(fa_right);
		draw_text(guiWidth - 4, guiHeight - 4, "Press Enter to purchase " + string(desc ));
	draw_set_halign(fa_left);
draw_set_valign(fa_top);

