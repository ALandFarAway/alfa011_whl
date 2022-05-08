//::////////////////////////////////////////////////////////////////////
//:: Placeable OnUse Script
//::////////////////////////////////////////////////////////////////////
/*  Works for ALFA scripts 5/2022 \Arri
    
	rewrite of patcha's On Sit script
	witch aint updated since 15-6-2007
	Uses SetScale instead of blunt force destroy 
	and respawn.
	this makes it possible to tint object without
	need to make multiple objects
	
	uses variables
	float Offset;   determines the offset of the 
					Facing of the placeable and 			
					the direction the player needs 
					to sit
	float MedScaleX: the scale from small to med size on the X axis
	float MedScaleY: the scale from small to med size on the Y axis
	float MedscaleZ: the scale from small to med size on the Z axis
					
	float SmallScaleX: the scale from met to small on the X axis
	float SmallScaleY: the scale from met to small on the Y axis
	float SmallScaleZ: the scale from met to small on the Z axis

	note: Scale numbers are same as in the blueprints of the toolset
	1;1;1 (X,Y,Z)	
*/
//:://///////////////////////////////////////////////////////////////////
//:: Created By: Meesterslager aka DeekinTheMadWizard
//:: Created On: 29-9-2009
//:://///////////////////////////////////////////////////////////////////

void AnimationSitDelayWrapper (object oObject)
{
	PlayCustomAnimation (oObject, "sitidle", 1, 1.0);
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

void main()
{
	object oSit = OBJECT_SELF;
	// Checks if seat is taken and stop the script if it is.
	object oLastSitter = GetLocalObject (oSit, "LastSitter");
	if (GetDistanceBetween (oSit, oLastSitter) <= 0.1 && GetArea(oSit) == GetArea (oLastSitter))
		return;
	else
	{
		int nSizeSit = GetLocalInt (oSit, "Size");
		int nSizeSitter;
		location lSit = GetLocation (oSit);
		float fOffset = GetLocalFloat (oSit, "Offset");
		float fFacing = GetNormalizedDirection (GetFacing (oSit) + fOffset);
		object oSitter = GetLastUsedBy();
		// Check Sitter Size (dwarves are small for sitting purposes)
		if (GetCreatureSize (oSitter) == CREATURE_SIZE_MEDIUM && GetRacialType(oSitter) != RACIAL_TYPE_DWARF)
			nSizeSitter = 0;
		else if (GetCreatureSize (oSitter) == CREATURE_SIZE_SMALL ||
				 GetRacialType(oSitter) == RACIAL_TYPE_DWARF)
			nSizeSitter = 1;
		// Change the size of 0Sit if sizes dont match
		if (nSizeSit != nSizeSitter)
		{
			if (nSizeSit == 0)
			{
				SetScale (oSit, GetLocalFloat (oSit, "SmallScaleX"), GetLocalFloat (oSit, "SmallScaleY"), GetLocalFloat (oSit, "SmallScaleZ"));
				SetLocalInt (oSit, "Size", 1);
			}
			else if (nSizeSit == 1)
			{
				SetScale (oSit, GetLocalFloat (oSit, "MedScaleX"), GetLocalFloat (oSit, "MedScaleY"), GetLocalFloat (oSit, "MedScaleZ"));	
				SetLocalInt (oSit, "Size", 0);
			}	
		}
		// Time to start to sit
			AssignCommand (oSitter, ClearAllActions());
			SetLocalObject (oSit,"LastSitter", oSitter);
			AssignCommand (oSitter,ActionMoveToLocation	(lSit));
			DelayCommand (1.5, AssignCommand (oSitter, SetFacing (fFacing)));
			DelayCommand (2.5, AssignCommand (oSitter, AnimationSitDelayWrapper (oSitter)));
	}
}