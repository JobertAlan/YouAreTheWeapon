///@description Shop Variables

//Shop Variables
shopOpen = false;
global.shop = false;

global.inv = ds_list_create();
global.money = 100;

selected = 0; 

//Items
items = ds_list_create();

ds_list_add(items, ["Item_1", 20, "Apple"]);
ds_list_add(items, ["Item_2", 30, "Orange"]);
ds_list_add(items, ["Item_3", 40, "Watermelon"]);

itemCount = ds_list_size(items);
 
//GUI Properties
display_set_gui_size(1280, 720);
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

menuWidth = guiWidth * 0.3;
menuMargin = guiWidth * 0.1;

previewWidth = (guiWidth - (menuWidth + menuMargin));
