function player_state_free()
{
	#region Controles
	// (wasd) ou (setas)
	var _left	=	keyboard_check(ord("A")) || keyboard_check(vk_left);
	var _right	=	keyboard_check(ord("D")) || keyboard_check(vk_right);
	var _up		=	keyboard_check(ord("W")) || keyboard_check(vk_up);
	var _down	=	keyboard_check(ord("S")) || keyboard_check(vk_down);
	var _jump	=	keyboard_check_pressed(vk_space);
	#endregion

	#region Movimentação
	var _move = _right - _left != 0; // Se minha movimentação for diferente de 0

	vspd += grv; // Aplicando gravidade
	vspd = clamp(vspd, vspd_min, vspd_max); // Limita a velocidade vestical

	if (_move) // Se eu estiver apertando  alguma tecla, eu ando!
	{
		sprite_index = sPlayerRun;
		move_dir = point_direction(0, 0, _right - _left, 0); // Essa função retorna uma direção
		move_spd = approach(move_spd, move_spd_max, acc); 
	}
	else  // Se não, eu fico parado!
	{
		sprite_index = sPlayer;
		move_spd = approach(move_spd, 0, dcc);
	}
	
	can_move = approach(can_move, 0, .4) // Depois de pular ele zera o can_move

	if (can_move <= 0) 
	{
		hspd = lengthdir_x(move_spd, move_dir); // Move o x para uma direção e uma quantidade 
	}

	if (hspd != 0) // Virar personagem
	{
		x_scale = sign(hspd);
	}
	#endregion

	#region Pulo
	var _ground = (place_meeting(x, y+1, oWall)); // Variável do chão
	var _wall = place_meeting(x+1, y, oWall) || place_meeting(x-1, y, oWall); // Checa se estou colidindo com a lateral de uma plataforma 

	if (_ground) // Se eu estiver no chão
	{
		coyote_time = coyote_time_max;
	}
	else // Se eu não estiver no chão
	{
		coyote_time --;
		/*if (vspd < 0)							
		{
			sprite_index = sPlayerJump;				// COLOCAR SPRITE
		}
		else if (vspd > 0)
		{
			sprite_index = sPlayerFall;				// COLOCAR SPRITE
		}*/ 
	}

	if(_jump and coyote_time > 0) // Se eu pular
	{
		coyote_time = 0;
		vspd = 0;
		vspd -= jump_height;
	}
	
	if (_wall and !_ground)
	{	
		if (vspd > 1) // Desliza mais devagar
		{
			//sprite_index = sPlayerWall			// COLOCAR SPRITE
			vspd = 1;
		}

		if (_jump) // Se eu pular
		{
			coyote_time = 0;
			vspd = 0;
			vspd -= jump_height;
			can_move = 5;
			hspd -= 4 * x_scale; // Impusso para a diagonal quando estiver pulando entre plataformas
		}
	}
	#endregion
}