//Goes in the NPCs onspawn slot

void main()
{
//Sits the NPC down
int nChair = 1;
object oChair;
//"NPC_CHAIR" is the tag name of the chair to be used
oChair = GetNearestObjectByTag("NPC_CHAIR", OBJECT_SELF, nChair);
ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,1.0,5000.0);
ActionSit (GetNearestObjectByTag ("NPC_CHAIR", OBJECT_SELF)); 
}
