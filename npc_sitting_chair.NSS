//Goes in the NPCs onspawn slot

/*void main()
{
//Sits the NPC down
int nChair = 10;
object oChair;
//"NPC_CHAIR" is the tag name of the chair to be used
oChair = GetNearestObjectByTag("NPC_CHAIR", OBJECT_SELF, nChair);
//ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,1.0,5000.0);
ActionSit(oChair);
 
}*/

// Put this OnPerception.
//  Will make NPC sit on a chair they spawn over
// Will abort (do nothing) if fighting or talking or if no PCs are in the area.


#include "acr_spawn_i"
void main()
{
	if (GetLocalInt(GetModule(),"Stop Ambient Life"))
	{
		return;
	}

	PlayCustomAnimation(OBJECT_SELF,"sitfidget", 1);

		SetOrientOnDialog(OBJECT_SELF,FALSE);//keeps NPC from turning when talked too
		SetBumpState(OBJECT_SELF,BUMPSTATE_UNBUMPABLE); //keeps NPC from being bumped and standing	
}