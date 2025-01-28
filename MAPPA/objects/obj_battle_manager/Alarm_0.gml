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


check_game_end()

switch (global.enemyTurn) {
    
    // Contains all player actions
    case 0:
        
        switch (global.playerAction) {
                            
            case 0:  // Add Shield to player
                global.playerEnergy-= 3;    
            
                global_add_shield(global.enemyTurn)
                show_debug_message("current shields: " + string(global.playerShield))
                show_debug_message("current energy " + string(global.playerEnergy))
            break;
            
            case 1:  // Basic Player Attack
                global.playerEnergy--;    
            
                global_basic_attack(global.playerDmg, global.enemyTurn);
                show_debug_message("current enemy hp " + string(global.enemyHp))
            
                
                show_debug_message("current energy " + string(global.playerEnergy)) 
            break;
        }
        
        if (global.playerEnergy <= 0)
        {
            global.enemyTurn = 1;
            global.playerEnergy = 5;    
            
            
            alarm[0] = 30;
        }
        
    
    break; // break for case 0 player turn
    
    
    
    // Contains all enemy actions
    case 1:
        
        switch (global.enemyNextMove) {
            
            case 0: // Add Shield to enemy
                global_add_shield(global.enemyTurn)
                            show_debug_message("current enemy shields: " + string(global.enemyShield))
                            
            break;
            
            case 1: // Do an attack
                global_basic_attack(global.enemyDmg, global.enemyTurn)
            break;
        }
    
        global.enemyTurn = 0;
    
    break;
    
    
    
}

//  was supposed to show enemy turn before the enemy does it but ehhh i can't be arsed to figure out where to put it
//if (global.playerEnergy == 5)
//{
    //global.enemyNextMove = enemy_next_move();
//}
//
check_game_end()



