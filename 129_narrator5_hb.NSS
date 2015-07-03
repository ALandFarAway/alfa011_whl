
//0b_guitarman_hb

//quick and cheap way to get guys to play animations indefinitely: Playing the Lute.

// DBR 5/31/06


void main()
{
int iRandom = Random(3);

if (iRandom == 3)
	{	PlayCustomAnimation(OBJECT_SELF, "talkinjured", 1);
		ActionSpeakString("Woe to those who plotted to harm the King! He turned their barbs and arrows against them!");
	}
}