
//0b_guitarman_hb

//quick and cheap way to get guys to play animations indefinitely: Playing the Lute.

// DBR 5/31/06


void main()
{
int iRandom = Random(3);

if (iRandom == 2)
	{	PlayCustomAnimation(OBJECT_SELF, "bardsong", 0);
		ActionSpeakString("A boon to his people, the Great Lord preserves the wisdom of Fallen Netheril.");
	}
}