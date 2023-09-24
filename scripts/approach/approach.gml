// Essa função aproxima 2 valores
function approach(_val1, _val2, _amount)
{
	if (_val1 < _val2)
	{
		_val1 += _amount;
		if (_val1 > _val2)
			return _val2;
	}
	else 
	{
		_val1 -= _amount;
		if (_val1 < _val2)
			return _val2;
	}
	return _val1;
}