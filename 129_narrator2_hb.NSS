
//0b_guitarman_hb

//quick and cheap way to get guys to play animations indefinitely: Playing the Lute.

// DBR 5/31/06


void main()
{
int iRandom = Random(3);

if (iRandom == 2)
	{	PlayCustomAnimation(OBJECT_SELF, "worship", 0);
		ActionSpeakString("Speak his fame unto all nations! At his command the Desert Anauroch stills its fiery breath and the snows of Winter become like a Summer meadow.");
	}
}