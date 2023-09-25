hspd = move_dir * move_spd;

if (place_meeting(x+sign(hspd), y, oWall)) // Colisão com a parede
{
	move_dir *= -1 // Se ele colidir ele volta
}

var _colisao = place_meeting(x+sign(hspd), y, oPlayer) || place_meeting(x, y-1, oPlayer) // Colisão com o player de lado ou em cima

if (_colisao) // Se colidir, o player segue a plataforma
{
	with(oPlayer)
	{
		if (!place_meeting(x+other.hspd, y, oWall))
		{
			x += other.hspd;
		}
	}
}

x += hspd;