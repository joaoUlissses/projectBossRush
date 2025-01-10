sprite_offset_y += sprite_offset_speed;

// Inverte a direção ao atingir os limites
if (sprite_offset_y > sprite_offset_max || sprite_offset_y < -sprite_offset_max) {
    sprite_offset_speed = -sprite_offset_speed;
}
