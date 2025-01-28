action = function() 
{
     // Calculate additional shield based on global.damage
    var local_shield = global.damage; // Use global.damage as a base
    local_shield += 5; // Add 5 to the shield value

    // Call the player_skill function and pass the additional shield
    obj_battle_manager.player_skill(local_shield);
}