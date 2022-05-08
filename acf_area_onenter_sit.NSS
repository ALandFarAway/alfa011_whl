////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_area_onenter.nss
//      Version : 0.1
//         Date : 7/25/06
//       Author : Ronan
//
//  Local Variable Prefix =
//
//
//  Dependencies external of nwscript:
//
//  Description
//  This script calls the ACR's OnAreaEnter code, and any custom code a server
//  may need. It is not updated in ACR updates.
//
//  Revision History
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#include "acr_area_i"

////////////////////////////////////////////////////////////////////////////////
// Constants ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Structures //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Global Variables ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Prototypes /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

//! The main event handler.
void main();

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#include "ginc_math"
#include "ginc_cutscene"

///////////////////////////////////////////////////////////////////////////////////////////////////
// SET "TRYSIT" VARIABLE TO 1 ON NPC AT BUILD TIME OR VIA SCRIPT TO MAKE THEM KEEP ATTEMPTING TO SIT
// THIS FUNCTION CAUSES PROBLEMS WHEN ADDED TO ALB_FUNCTIONS
// NB: NPCS MAY STRUGGLE TO SIT WHEN NOT CLOSE TO A CHAIR DUE TO WALKMESH ISSUES !!!!!!!!!!!!!!!!!!!
///////////////////////////////////////////////////////////////////////////////////////////////////

void ForceNPCReseat(object oTarget) 
{	
	if(GetLocalInt(oTarget, "TRYSIT") == 0){return;} // SITTING HAS BEEN CANCELLED	
			
	object oCurrentChair = GetLocalObject(oTarget, "Seated");
		
	// SendMessageToPC(GetFirstPC(TRUE), GetName(oTarget) + " IS TRYING TO SIT"); // DEBUG			
	
	// FIND THE NEAREST AVAILABLE CHAIR (USE THE FIRST 8 CHARACTERS E.g. pat_mid_chair5)
	int iCount = 1; object oChair = GetNearestObject(OBJECT_TYPE_PLACEABLE, oTarget, iCount);
	
	while(oChair != OBJECT_INVALID)
	{	
		// FIND A CHAIR WITHOUT A CURRENT USER
		if(GetStringLeft(GetTag(oChair), 8) == "pat_mid_")
		{
			object oCurrentSeater = GetLocalObject(oChair, "LastSeated");
			
			// TRY IGNORING THE FACT THAT THE LAST SEATED CHAIR HAD AN OCCUPANT (IT WAS PROBABLY THEM ANYWAY PRIOR EXIT)
			if(oCurrentSeater == OBJECT_INVALID || oCurrentSeater == oTarget)
			{
				//SendMessageToPC(GetFirstPC(TRUE), GetName(oTarget) + " FOUND A CHAIR"); // DEBUG	
				break;
			}
		} 
			
		iCount = iCount + 1; oChair = GetNearestObject(OBJECT_TYPE_PLACEABLE, oTarget, iCount);	
	}			
	
	// MAKE TARGET USE THIS CHAIR
	SetLocalObject(oChair, "LastSeated", oTarget); 
	SetLocalObject(oTarget, "Seated", oChair);	
	AssignCommand(oTarget, ClearAllActions(TRUE));
	AssignCommand(oTarget, ActionInteractObject(oChair));	
}   

void fadetoblack(float fSpeed, float fFailsafe, int nColor)
{

	object oPCh = GetEnteringObject();

	if (IsFloatNearInt(fFailsafe, 0))
		fFailsafe = 15.0f;

	FadeToBlackParty(oPCh, 1, fSpeed, fFailsafe, nColor);

}

void main()
{

	object oCreature = GetEnteringObject();
	
	// ONLY RUN WHEN PLAYER ENTERS
	if(!GetIsPC(oCreature)){return;}
	
	fadetoblack(3.2,3.2,0);
	
	
	object oArea = GetArea(oCreature);
	
	object oNPC = GetFirstObjectInArea(oArea);
	
	while(oNPC != OBJECT_INVALID)
	{		
		// RESEAT NPCS
		if(GetObjectType(oNPC) == OBJECT_TYPE_CREATURE && GetLocalInt(oNPC, "TRYSIT") == 1)
		{			
			DelayCommand(0.5, ForceNPCReseat(oNPC));		
		}
		
		oNPC = GetNextObjectInArea(oArea);
	}


}