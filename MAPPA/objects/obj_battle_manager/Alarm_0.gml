// Dev note: Sorry kenneth for the hieroglyphics -joerge

/** 
    For switch case,
*  0 = player's turn
*  1 = enemy's turn
**/

/**
*  Will be done through numbers to determine what case will happen 
*  0 = player add shield
*  1 = player basic attack
*  2 = player dex attack 1
*  3 = player dex attack 2
*  4 = player str attack 1
*  5 = player str attack 2
* */

switch (global.enemyTurn) {
    
    // Contains all player actions
    case 0:
        
        switch (global.playerAction) {
                            
            case 0:  // Add Shield to player
                global_add_shield(global.enemyTurn)
                show_debug_message("current shields: " + string(global.playerShield))
                show_debug_message("current energy " + string(global.playerEnergy))
            break;
            
            case 1:  // Basic Player Attack
                
                global_basic_attack(global.playerDmg, global.enemyTurn);
                show_debug_message("current enemy hp " + string(global.enemyHp))
            
                
                show_debug_message("current energy " + string(global.playerEnergy)) 
            break;
        }
        
        
    
    break; // break for case 0 player turn
    
    // Contains all enemy actions
    case 1:
        switch (global.enemyNextMove) {
            
            case 0: // Add Shield to enemy
                global_add_shield(global.enemyTurn)
            break;
            
            case 1: // Do an attack
                global_basic_attack(global.enemyDmg, global.enemyTurn)
            break;
        }
    break;
    
    
    
}


