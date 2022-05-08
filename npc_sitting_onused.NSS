/*This works in conjunction with the acf_area_onenter_sit which must be on the area 
that you want NPCs sitting in.  All NPCs that need to sit should have the Variable 'TRYSIT =1" 
placed on them.

This script needs to be put in the OnUsed portion of your sit object
*/


void ActionPlayCustomAnimation(object oObject, string sAnimationName, int nLooping, float fSpeed = 1.0f)
{
PlayCustomAnimation(oObject, sAnimationName, nLooping, fSpeed);
}

// float GetNormalizedDirection(float fDirection):
// * This script returns a direction normalized to the range 0.0 - 360.0
// * Copyright (c) 2002 Floodgate Entertainment
// * Created By: Naomi Novik
// * Created On: 11/08/2002
float GetNormalizedDirection(float fDirection)
{
float fNewDir = fDirection;
while (fNewDir >= 360.0) {
	fNewDir -= 360.0;
}
while (fNewDir <= 0.0) {
	fNewDir += 360.0;
}

return fNewDir;
}

        void SitDown(object oSitter, object oChair)
        {		
        	AssignCommand(oSitter, SetFacing(GetNormalizedDirection(GetFacing(oChair)+180.00+GetLocalFloat(oChair,"rotate")) ));
        	AssignCommand(oSitter, ActionPlayCustomAnimation(OBJECT_SELF, "sitidle", 1, 1.0));
        	
        	// EXTRA CODE THANKS TO SHAUGHN & EGUINTIR
        	
        	//SetOrientOnDialog(oSitter,FALSE);
        	SetBumpState(oSitter,BUMPSTATE_UNBUMPABLE);	
        }

        void main()
        {
        	object oChair = OBJECT_SELF; 
        	object oSitter = GetLastUsedBy();
            object oCheckSitter = GetLocalObject(oChair, "LastSeated");	
        	
        	//SendMessageToAllPCs("Chair used by " + GetName(oSitter));
        	    
            // RETRIEVE VARS ATTACHED TO CHAIR	
        	int iHeading  = GetLocalInt(oChair, "degree");		
        	string sName = GetFirstName(oChair); 
            
        	//Assign the heading degrees
        	location lChair_o = GetLocation(oChair);
            location lChair = Location(GetArea(oChair), GetPositionFromLocation(lChair_o), GetNormalizedDirection(GetFacingFromLocation(lChair_o) + iHeading));
        	
            // CHECK THE SEAT IS FREE
        	if(GetLocalObject(oChair, "LastSeated") != OBJECT_INVALID && oSitter != oCheckSitter)
            {		
        		FloatingTextStringOnCreature("<<< The seat is already being used by somebody. >>>", oSitter, FALSE);		
        		return;	
            }
            
        	// SEAT THE USER & ASSOCIATE SEAT WITH NPC FOR RETURN SEAT	
        	if(oSitter != OBJECT_INVALID)
        	{	
        	SetLocalObject(oChair, "LastSeated", oSitter);
        	SetLocalObject(oSitter, "Seated", oChair);
        	}
        	
        	// JUST USE THE STANDARD CHAIRS
        	AssignCommand(oSitter, ActionMoveToLocation(lChair));
        	DelayCommand(2.0, SitDown(oSitter, oChair));
        }



