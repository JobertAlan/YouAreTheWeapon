action = function() {
    // Omega Scuffed Damage
	// global damage set to 1, modify it in every card
    var local_damage = global.damage;
    local_damage += 0;

   
    obj_battle_manager.player_attack(local_damage);
}