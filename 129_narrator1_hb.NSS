
//0b_guitarman_hb

//quick and cheap way to get guys to play animations indefinitely: Playing the Lute.

// DBR 5/31/06


void main()
{
int iRandom = Random(3);

if (iRandom == 2)
		{
		PlayCustomAnimation(OBJECT_SELF, "talksad", 0);
		ActionSpeakString("Weep, weep, O Anauria! Your greatest son and father to the people is no more!");
		}
}