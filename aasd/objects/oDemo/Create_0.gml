///@description Create the map

//          WOW !!!!
// Only one script OwO !
create_map(0, 0, room_width, room_height,false, 130, [1.6, 1, 1.2] );
// If you add the other arguments the IDE will bark at you but don't worry it works fine.


///                 Arguments :
//-  Starting X
//-  Starting Y
// - Ending X
// - Ending Y

// Optionals arguments :        write   undefined   if you don't want to modify one but the followings ones
// - Change the rotation from vertical (false) to horizontal (true)
// - Number of bubles you want during the physic simulation (integer)
// - The different sizes of bubles (array)        exemple : [0.6, 1, 1.2]
// - The sprite to use to draw the points       exemple : spr_points       it will take one random image from it
// - The depth of the map to be drawn on (integer between -10000 and 10000)