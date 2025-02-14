////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_area_onexit.nss
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
//  This script calls the ACR's OnAreaExit code, and any custom code a server
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

// The main event handler.
void main();

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

void main() {
    ACR_AreaOnExit();

// Custom code goes below this line.
object oExiter = GetExitingObject(); 
effect eTest = GetFirstEffect(oExiter); 

 
while (GetIsEffectValid(eTest)) 
	{ 
    if (GetEffectCreator(eTest) == OBJECT_SELF) 
	{ 
    RemoveEffect(oExiter, eTest); 
    } 
    eTest = GetNextEffect(oExiter); 
	} 
		
// Decrease Increment pseudo-heartbeat

int iPop = GetLocalInt(OBJECT_SELF, "iPop");
if (GetIsPC(oExiter) && !GetIsDM(oExiter)) 
	{
	//SendMessageToPC(oExiter, "Heartbeat--"); // for debugging
	iPop--;
	SetLocalInt(OBJECT_SELF, "iPop", iPop);
	if (iPop < 1) 
	{
	SetLocalInt(OBJECT_SELF, "iHB", 0);
	}
    }

//ACR_AreaOnExit(); 

SendMessageToPC(oExiter, "You have left travel area "+GetName(OBJECT_SELF)); 
}