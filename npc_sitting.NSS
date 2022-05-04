//::///////////////////////////////////////////////
//:: NPC_SITTING.nss
//:: Altered from the nw_c2_sitting
//:://////////////////////////////////////////////
/*
  Will make the NPC sit down on a chair
  Place this in the onspawn of the NPC 
  Chair needs to have the tag NPC_CHAIR on it and set to walkable/useable
*/
//:://////////////////////////////////////////////
//:: Created By:Arri
//:: Created On:5/2022
//:://////////////////////////////////////////////

#include "acr_spawn_i"

void main()
{
   // ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,1.0,5000.0);
   // * do not do this if already sitting
   
   if (GetCurrentAction() != ACTION_SIT)
   {
        ClearAllActions();
        int i = 1;
        // * find first free chair
        object oChair = GetNearestObjectByTag("NPC_CHAIR", OBJECT_SELF,i);
        int bFoundChair = FALSE;
        while (bFoundChair == FALSE && GetIsObjectValid(oChair) == TRUE)
		SetOrientOnDialog(OBJECT_SELF,FALSE);//keeps NPCs from turning to face PC
		SetBumpState(OBJECT_SELF,BUMPSTATE_UNBUMPABLE); //Keeps NPCs from being bumped to a standing postition
        {
          // * This chair is free
          if (GetIsObjectValid(GetSittingCreature(oChair)) == FALSE)
          {
              bFoundChair = TRUE;
              ActionSit(oChair);
			  ClearAllActions();
          }
          else
          {
              i++;
              oChair = GetNearestObjectByTag("NPC_CHAIR", OBJECT_SELF,i);
          }
        }
        if (bFoundChair == FALSE)
        {
           // SpeakString("This sucks I have no place to sit");
           ClearAllActions();
           ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
        }
    }
}