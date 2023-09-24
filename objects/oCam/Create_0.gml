global.view_target = oPlayer; // Variavel para a câmera seguir um objeto(player) 
window_set_size(VIEW_WIDTH * VIEW_SCALE, VIEW_HEIGHT * VIEW_SCALE); // Tamanho da Janela
surface_resize(application_surface, VIEW_WIDTH * VIEW_SCALE, VIEW_HEIGHT * VIEW_SCALE); // Torna o tamanho da surface igual ao tamanho da janela
alarm[0] = 1; // Alarme para centraliza a janela