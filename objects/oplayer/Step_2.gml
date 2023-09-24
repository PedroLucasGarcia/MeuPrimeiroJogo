#region Colisão
// Colisão horizontal
repeat(abs(hspd))
{
	if (place_meeting(x+sign(hspd),y,oWall))
	{
		hspd = 0;
		break;
	}
	else
	{
		x+=sign(hspd);
	}
}

// Colisão vestical
repeat(abs(vspd))
{
	if (place_meeting(x,y+sign(vspd),oWall))
	{
		vspd = 0;
		break;
	}
	else
	{
		y+=sign(vspd);
	}
}
#endregion