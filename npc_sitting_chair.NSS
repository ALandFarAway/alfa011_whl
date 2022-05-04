//Goes in the NPCs onspawn slot

/*void main()
{
//Sits the NPC down
int nChair = 1;
object oChair;
 //ClearAllActions();
//"NPC_CHAIR" is the tag name of the chair to be used
oChair = GetNearestObjectByTag("NPC_CHAIR", OBJECT_SELF, nChair);
ActionSit(oChair);
SetOrientOnDialog(OBJECT_SELF,FALSE);//keeps NPCs from turning to face PC
SetBumpState(OBJECT_SELF,BUMPSTATE_UNBUMPABLE); //Keeps NPCs from being bumped to a standing postition
}*/

#include "acr_spawn_i"

void main()
{
object oPC = GetLastPerceived();

if (!GetIsPC(oPC)) return;

if (!GetLastPerceptionSeen()) return;
object oTarget;
oTarget = OBJECT_SELF;
	if (GetLocalInt(GetModule(),"Stop Ambient Life"))
	{
		return;
	}
if (GetCurrentAction() != ACTION_SIT)
   {	
 int i = 1;
        // * find first free chair
        object oChair = GetNearestObjectByTag("NPC_CHAIR", OBJECT_SELF,i);
        int bFoundChair = FALSE;
        while (bFoundChair == FALSE && GetIsObjectValid(oChair) == TRUE)
			PlayCustomAnimation(OBJECT_SELF,"sitidle", 1);
		SetOrientOnDialog(OBJECT_SELF,FALSE);//keeps NPCs from turning to face PC
		SetBumpState(OBJECT_SELF,BUMPSTATE_UNBUMPABLE); //Keeps NPCs from being bumped to a standing postition	
	
}	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	