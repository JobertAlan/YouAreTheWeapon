check_game_end()

if (global.playerHp <= 0) {
	show_debug_message("Game Finished! Boss wins!");
	exit;

} else if (global.bossHp <= 0) {
	show_debug_message("Game Finished! You win!");
	exit;
}

//player turn

switch (global.enemyNextMove) {
	case 0:
	switch (global.playerAction){
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

case 1:

//boss turn after alarm

switch (global.enemyNextMove && global.enemyTurn != -1) {
	case 0:
	switch (global.enemyNextMove) {
	case 0: //shield
		global.bossShield = min(global.bossShield + 3, 10);
		show_debug_message("Boss used shield!")
		break;
	case 1: //basic
		if(global.playerShield > 0) {
			global.playerShield = max(0, global.playerShield - global.bossDmg);
		}else
		{
			global.playerHp = max(0, global.playerHp - global.bossDmg);
		}
		show_debug_message("Boss attacked!")
		break;
	case 2: //heavy
		var damage = global.bossDmg * 1.5 ;
		if(global.playerShield > 0) {
			global.playerShield = max(0, global.playerShield - damage);
		}else
		{
			global.playerHp = max(0, global.playerHp - damage);
		}
		global.playerEnergy = max(0, global.playerEnergy - 1);
		show_debug_message("Boss landed a heavy attack! Both hp and energy drops!")
		break;
	case 3: //heal
		global.bossHp = min(global.bossHp + 3, 30);
		show_debug_message("Boss healed its damages!")
		break;
	case 4: //debuff
	global.playerDmg = max(5, global.playerDmg - 2);
	break;
	}
	
	
	//reset
	global.enemyNextMove = -1
	global.enemyTurn = false;
}
}
check_game_end()
