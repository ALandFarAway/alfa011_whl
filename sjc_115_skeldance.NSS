
//0b_guitarman_hb

//quick and cheap way to get guys to play animations indefinitely: Playing the Lute.

// DBR 5/31/06


void main()
{

	int nRandom=Random(3);
	if (nRandom==0)
	{
		PlayCustomAnimation(OBJECT_SELF,"dance01", 1);
		
	}
	else if (nRandom==1)
	{
		PlayCustomAnimation(OBJECT_SELF,"dance02", 1);
		
	}
	else
	{
		PlayCustomAnimation(OBJECT_SELF,"dance03", 1);
		
	}
}