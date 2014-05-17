// catch-all script for getting bounty items from spawned placeables
// replaces spawning placeables with inventory due to dropping items OnDeath
// Teric 11/10/10


#include "acr_i"

void main()
{
object oPC = GetLastUsedBy();
string sBounty = GetLocalString(OBJECT_SELF, "SJC_BOUNTY_OBJECT");
object oBounty = GetObjectByTag(sBounty);
if (GetIsSkillSuccessful(oPC, SKILL_KNOWLEDGE_NATURE, 10, FALSE))
	{
		SendMessageToPC(oPC, "Harvesting Successful");
		CreateItemOnObject(sBounty, oPC);
		DestroyObject(OBJECT_SELF);
	}
	
else
	{
	SendMessageToPC(oPC, "[FAIL Knowledge/Nature]Damn it! You have failed to harvest the item correctly");
	DestroyObject(OBJECT_SELF);
	}















}