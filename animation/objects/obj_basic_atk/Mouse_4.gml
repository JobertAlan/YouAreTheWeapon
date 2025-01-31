if (global.enemyTurn) exit;
if (global.playerEnergy < 1) exit;
    

action();



instance_create_depth(956, 253, -1, obj_damage_animation);


// Change sprite to attack animation
obj_player.sprite_index = evo1_attack; // Use the actual sprite asset name
image_index = 0;
image_speed = 1;
alarm[0] = (image_number / image_speed) * room_speed;