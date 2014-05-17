
//0b_guitarman_hb

//quick and cheap way to get guys to play animations indefinitely: Playing the Lute.

// DBR 5/31/06


void main()
{


	int nRandom=Random(5);
	if (nRandom==0)
	{
		PlayCustomAnimation(OBJECT_SELF,"idlefidgetdrum", 1);
		SoundObjectStop(GetObjectByTag("sjc_112_drum_1"));
	}
	else if (nRandom==1)
	{
		PlayCustomAnimation(OBJECT_SELF,"idledrum", 1);
		SoundObjectStop(GetObjectByTag("sjc_112_drum_1"));
	}
	else
	{
		PlayCustomAnimation(OBJECT_SELF,"playdrum", 1);
		SoundObjectPlay(GetObjectByTag("sjc_112_drum_1"));
	}
}