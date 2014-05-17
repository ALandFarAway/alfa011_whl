
//0b_guitarman_hb

//quick and cheap way to get guys to play animations indefinitely: Playing the Lute.

// DBR 5/31/06


void main()
{
	
	int nRandom=Random(5);
	if (nRandom==0)
	{
		PlayCustomAnimation(OBJECT_SELF,"idlefidgetflute", 1);
		
	}
	else if (nRandom==1)
	{
		PlayCustomAnimation(OBJECT_SELF,"idleflute", 1);
		
	}
	else
	{
		PlayCustomAnimation(OBJECT_SELF,"playflute", 1);
		PlaySound("as_cv_flute1");
	}
}