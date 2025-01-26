///@description Control the Shop

//Open Shop Method
if (keyboard_check_pressed(vk_space)) {
	
	shopOpen = true;
	global.shop = true;
	
} else if (shopOpen) && (keyboard_check_pressed(vk_escape)) {

	shopOpen = false;
	global.shop = false;

}

//Shop is Open
if (shopOpen) {
	
	//Check for active selection
	if (keyboard_check_pressed(vk_down)) {
		
		selected ++;
		if (selected == itemCount) selected = 0;
		
	}
	
	if (keyboard_check_pressed(vk_up)) {
		
		selected --;
		if (selected < 0) selected = itemCount - 1;
		
	}
	
	//Buy an Item
	var arr = items[| selected];
	var item = arr[0];
	var price = arr[1];
	
	if (keyboard_check_pressed(vk_enter)) {
		
		//Add item to loadout / inventory	
		ds_list_add(global.inv, item);
		global.money -= price;
		
	}
	
}
