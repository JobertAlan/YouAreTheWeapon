if (!clear_condition)
{
    if (room == map_room) 
    {
        if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width*0.7, y - sprite_height*0.7, x + sprite_width*0.7, y + sprite_height*0.7))
        {
            draw_sprite(spr_hover, 0, x, y);
        }
        else // Add another draw sprite here to indicate cleared levels
        {
            draw_self();
        }
    }
}