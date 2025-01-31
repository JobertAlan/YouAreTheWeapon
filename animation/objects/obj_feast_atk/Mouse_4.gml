if (global.enemyTurn) exit;
    
if (global.playerEnergy < 1) exit;
    
action();

instance_create_depth(956, 253, -1, obj_damage_animation);