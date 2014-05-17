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
#include "X0_I0_PARTYWIDE"
#include "acr_db_persist_i"
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

// Define time period between encounter checks (seconds real-time).
float fInterval = 105.0;
// Step through the PCs in area and if they are lone travellers or party leaders 
// make an encounter roll. If successful transfer the PC or party to the correct
// encounter area. Repeat with the frequency defined in fInterval.
void MakeEncounterRoll()
	{
	int iHB = GetLocalInt(OBJECT_SELF, "iHB");
    if (iHB) 
	{
	// start actual heartbeat code
	//SendMessageToPC( GetFirstPC(), "Click" ); //Debug
	object oSubject = GetFirstPC();
	while (GetIsObjectValid(oSubject) == TRUE)
		{
		//Check whether each PC on the server is in this area
		location lPCLocation = GetLocation(oSubject);
		object oPCArea = GetAreaFromLocation(lPCLocation);
		if (oPCArea == OBJECT_SELF)
			{
			//SendMessageToPC( GetFirstPC(), "In correct area" ); //Debug
			// If PC is solo or party leader carry on with encounter check
			if (GetNumberPartyMembers(oSubject) == 2 | GetFactionLeader(oSubject) == oSubject)
				{
				//SendMessageToPC( GetFirstPC(), "Solo or leader" ); //Debug
				// Make encounter roll
				if (d100() <= GetLocalInt(oSubject, "sjc_encounterpercentage"))
					{
					//SendMessageToPC( GetFirstPC(), "Encounter Triggered" ); //Debug
					// Check if encounter area is not in use
					string sTerrainType = GetLocalString(oSubject, "sjc_terraintype");
					object oEncounterArea = GetObjectByTag("trenc_" + sTerrainType);
					int iAreaEmpty = GetLocalInt(oEncounterArea, "sjc_PCCount");
					if (iAreaEmpty == 0)
					//SendMessageToPC(GetFirstPC(), "EncounterArea Empty"); //Debug
					{					
					//Move PC and party to relevant encounter area
					SetLocalLocationOnAll(oSubject, "sjc_encounterpoint", GetLocation(oSubject));
					object oTarget = GetObjectByTag("encounterarea_" + sTerrainType);
					location lTarget = GetLocation(oTarget);
					object oPartyMember = GetFirstFactionMember(oSubject, TRUE);
					while (GetIsObjectValid(oPartyMember))
  						{
   						//ACR_SetPersistentLocation(oPartyMember, "sjc_encounterpoint", GetLocation(oPartyMember));
						AssignCommand(oPartyMember, ClearAllActions());
						AssignCommand(oPartyMember, ActionJumpToLocation(lTarget));
   						oPartyMember=GetNextFactionMember(oSubject, TRUE);
   						} 
					}
					}
				}
			
			
			}
		oSubject = GetNextPC();
		}
	// end actual heartbeat code
	DelayCommand(fInterval, MakeEncounterRoll());
    }

	}

void main() 

{
    ACR_AreaOnEnter();

// Custom code goes below this line.
// Scale and slow PC
// Teric 4/5/11 Apply shrinkage to all objects

effect eSlow = EffectMovementSpeedDecrease(75); 
effect eShrink = EffectSetScale( 0.25); 
effect eTravel = EffectLinkEffects(eSlow, eShrink); 
eTravel = SupernaturalEffect(eTravel);
object oEnterer = GetEnteringObject();
effect eTest = GetFirstEffect(oEnterer); 


while (GetIsEffectValid(eTest)) 
	{
      if (GetEffectCreator(eTest) == OBJECT_SELF) 
	  {
         //SendMessageToAllDMs("Relogging PC: Removing eTest from " + GetName(oEnterer));
         RemoveEffect(oEnterer, eTest); 
      } 
      eTest = GetNextEffect(oEnterer); 
   	}

AssignCommand(OBJECT_SELF, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTravel, oEnterer)); 
 
	
// Initialize pseudo heartbeat
int iPop = GetLocalInt(OBJECT_SELF, "iPop");
int iHB = GetLocalInt(OBJECT_SELF, "iHB");
if (GetIsPC(oEnterer) && !GetIsDM(oEnterer)) 
	{
	//SendMessageToPC(oEnterer, "Heartbeat++"); // for debugging
    iPop++;
    SetLocalInt(OBJECT_SELF, "iPop", iPop);
    if (iPop == 1) 
	{
    SetLocalInt(OBJECT_SELF, "iHB", 1);
    MakeEncounterRoll();
    }
    }
	
 
 
//ACR_AreaOnClientEnter(); 

SendMessageToPC(oEnterer, "You have entered Travel area "+GetName(OBJECT_SELF)); 
}