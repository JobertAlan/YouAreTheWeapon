// Global definitions for player stats

global.lvlsWon = 0;  // Tracker for what battles player can enter

global.enemyTurn = 0; // Tracks turn order, if 0 player goes first


global.playerAction = 0;  // Tracks what moves the player does (ex. attacking, shielding, iteming or what)

// Player variables
global.playerHp = 10;
global.playerDmg = 4;
global.playerShield = 0;
global.playerEnergy = 5;

// Initial player stats
global.playerStr = 1;
global.playerDex = 1;

// Shop variables currently not in use because tangina mo ali matuto ka mag git push
global.coin = 0;
global.shop = false;
global.inv = ds_list_create();



// Enemy variables, can be programatically altered and reset through obj_enemyX and through battle manager
global.enemyHp = 10;
global.enemyDmg = 1;
global.enemyShield = 0;

/** 
    0 = attack
 *  1 = shield

**/
global.enemyNextMove = 0;  // Tracks what action an enemy is going to make
