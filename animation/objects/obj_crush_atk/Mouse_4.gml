// Set the attack animation
obj_player.sprite_index = evo2_attack;
image_index = 0; // Start from the first frame
image_speed = 1; // Ensure animation plays at normal speed

// Set an alarm to revert back after animation completes
alarm[0] = (image_number / image_speed) * room_speed;
if (global.enemyTurn) exit;
if (global.playerEnergy < 1) exit;
action();