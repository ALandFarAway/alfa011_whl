
//0b_guitarman_hb

//quick and cheap way to get guys to play animations indefinitely: Playing the Lute.

// DBR 5/31/06


void main()
{


	int nRandom=Random(5);
	if (nRandom==0)
	{
		PlayCustomAnimation(OBJECT_SELF,"forge01", 1);
		//SoundObjectStop(GetObjectByTag("0_snd_lute_1"));
	}
	else if (nRandom==1)
	{
		PlayCustomAnimation(OBJECT_SELF,"forge02", 1);
		//SoundObjectStop(GetObjectByTag("0_snd_lute_1"));
	}
	else if (nRandom==2)
	{
		PlayCustomAnimation(OBJECT_SELF,"gettable", 0);
		//SoundObjectPlay(GetObjectByTag("0_snd_lute_1"));
	}

	else if (nRandom==3)
	{
		PlayCustomAnimation(OBJECT_SELF,"read", 1);
		//SoundObjectPlay(GetObjectByTag("0_snd_lute_1"));
	}
	
	else
	{
		PlayCustomAnimation(OBJECT_SELF,"craft01", 1);
		//SoundObjectPlay(GetObjectByTag("0_snd_lute_1"));	
	}
	
}