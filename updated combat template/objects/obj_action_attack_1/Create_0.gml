action = function() {
    // Omega Scuffed Damage
    var local_damage = global.damage;
    local_damage += 5;

   
    obj_battle_manager.player_attack(local_damage);
}