// Will make the NPC sit down
//*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "acr_creature_i"
#include "acr_spawn_i"

void main()
{
//    ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,1.0,5000.0);
   // * do not do this if already sitting
   
   // * May 2002 (Brent): Don't do this if I am in combat or conversation
   if (!GetIsInCombat() && !IsInConversation(OBJECT_SELF))
   if (GetCurrentAction() != ACTION_SIT)
   {
        ClearAllActions();
        int i = 1;
        // * find first free chair
        object oChair = GetNearestObjectByTag("NW_CHAIR", OBJECT_SELF,i);
        int bFoundChair = FALSE;
        while (bFoundChair == FALSE && GetIsObjectValid(oChair) == TRUE)
        {
          // * This chair is free
          if (GetIsObjectValid(GetSittingCreature(oChair)) == FALSE)
          {
              bFoundChair = TRUE;
              ActionSit(oChair);
          }
          else
		  int i = 1;
    object oChair = GetNearestObject(OBJECT_TYPE_PLACEABLE, OBJECT_SELF, i);
	while (oChair != OBJECT_INVALID) {
		if (FindSubString(GetStringLowerCase(GetTag(oChair)), "chair") != -1) {
			int nOccupied = GetLocalInt(oChair, "Occupied");
			
			if(nOccupied == 0) {
				SetLocalInt(oChair, "Occupied", 1);
				DelayCommand(5.0, AssignCommand(OBJECT_SELF, ActionForceMoveToObject(oChair, FALSE, 0.25, 30.0)));
				DelayCommand(10.0, AssignCommand(OBJECT_SELF, ActionJumpToObject(oChair, TRUE)));
				DelayCommand(11.0, AssignCommand(OBJECT_SELF, SetFacing(GetFacing(oChair)-180.0, FALSE)));
				DelayCommand(12.0, AssignCommand(OBJECT_SELF, SetBumpState(OBJECT_SELF,BUMPSTATE_UNBUMPABLE))); //Keeps NPCs from being bumped to a standing position 
				DelayCommand(13.0, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR, 1.0, 1800.0));
			    break;
				}
			else {
				i++;
				}
			}
		oChair = GetNearestObject(OBJECT_TYPE_PLACEABLE, OBJECT_SELF, i);
		}
          //{
            //  i++;
            //  oChair = GetNearestObjectByTag("NW_CHAIR", OBJECT_SELF,i);
         // }
        }
        if (bFoundChair == FALSE)
        {
           // SpeakString("This sucks I have no place to sit");
           ClearAllActions();
           ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
        }
    }
}