if (global.enemyTurn) exit;
if (global.playerEnergy < 1) exit;
action(); // Perform the attack

instance_create_depth(956, 253, -1, obj_damage_animation);


// Set the attack animation
obj_player.sprite_index = evo3_attack;
image_index = 0; // Start from the first frame
image_speed = 1.1; // Ensure animation plays at normal speed

alarm[0] = (image_number / image_speed) * room_speed;