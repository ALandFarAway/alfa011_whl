
// Put this OnPerception.
//  Will make NPC sit on the ground crosslegged  sitgrounddown sitgroundidle	
// Will abort (do nothing) if fighting or talking or if no PCs are in the area.

#include "acr_spawn_i"
#include "acr_creature_i"

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

	PlayCustomAnimation(OBJECT_SELF,"sitgroundidle", 1);
		SetOrientOnDialog(OBJECT_SELF,FALSE);//keeps NPC from turning when talked too
		SetBumpState(OBJECT_SELF,BUMPSTATE_UNBUMPABLE); //keeps NPC from being bumped and standing	
}