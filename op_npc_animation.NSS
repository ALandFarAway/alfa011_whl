// Put this OnPerception.
// place      sAnimation = "animation namefrom 2da"
// sitgroundidle = sits cross legged on the ground
// proneB = laying down
// sitfidget = sit on chair moving a little
// Will abort (do nothing) if fighting or talking or if no PCs are in the area.

#include "acr_spawn_i"

const string ANIMATION_VAR_NAME = "sAnimation";
const string ANIMATION_DEFAULT = "sitgroundidle";
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

string sAnimation = GetLocalString(OBJECT_SELF,ANIMATION_VAR_NAME);
if (sAnimation == "") sAnimation = ANIMATION_DEFAULT;

    PlayCustomAnimation(OBJECT_SELF, sAnimation, 1);
        SetOrientOnDialog(OBJECT_SELF,FALSE);//keeps NPC from turning when talked too
        SetBumpState(OBJECT_SELF,BUMPSTATE_UNBUMPABLE); //keeps NPC from being bumped and standing    
} 
