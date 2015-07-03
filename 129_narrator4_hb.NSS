
//0b_guitarman_hb

//quick and cheap way to get guys to play animations indefinitely: Playing the Lute.

// DBR 5/31/06


void main()
{
int iRandom = Random(3);

if (iRandom == 2)
	{	PlayCustomAnimation(OBJECT_SELF, "idlecower", 0);
		ActionSpeakString("Aiee! His hand is a hammer to his enemies! We shall feel his wrath for evermore!");
	}
}