// c_DoStuff (string sTarget)
/*
	Description:
	
	Parameters:
		sTarget -  Tag of the target object.  Default is OWNER.

		
	=== Condition Script general Info ===
	This is a conversation condition script template.  
	Condition script names are usually prefixed as follows:
		"gc_" - global condition script
		"kc_" - campaign condition script
		"<moduleID>c_" - module condition script
	Note that "c" stands for "condition" or "check" so no need to add these
	words to the script name.  For examples "kc_genasi_or_druid" would be preferable
	to "kc_check_genasi_or_druid"
		
	Conversation actions and conditions are the only scripts that can have parameters.
	Any number and many types of parameters can be passed.
*/
// Name_Date

#include "acr_db_persist_i"
int StartingConditional(string sTag)
{
	// OBJECT_SELF refers to the NPC.
    object oPC = GetPCSpeaker();
	object oArea = GetArea(OBJECT_SELF);
	int bRet = TRUE;	// the return value

	// Add code to check conditions
	if (ACR_GetPersistentInt(oArea, sTag + "CheckedOut") == 1)
	{
	bRet = FALSE;	
	}

	
		
	
	// return value - either TRUE or FALSE.
	return (bRet);
}