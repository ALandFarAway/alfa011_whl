// sjc_onused_swimpoint
// OnUsed event script for Swim Point
// Teric neDhalir 181109
// 
#include "acr_i"

int GetArmourPenalty(object oPC)
{
object oArmour = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);

if (oArmour == OBJECT_INVALID)
{return 0;}

int iArmourType = GetArmorRulesType(oArmour);
int iRank1;
	
	switch (iArmourType)
	{
	case 0: iRank1 = 0; break;
	case 1: iRank1 = 0; break;
	case 2: iRank1 = 0; break;
	case 3: iRank1 = -1; break;
	case 4: iRank1 = -2; break;
	case 5: iRank1 = -4; break;
	case 6: iRank1 = -6; break;
	case 7: iRank1 = -7; break;
	case 8: iRank1 = -6; break;
	case 9: iRank1 = 0; break;
	case 10: iRank1 = 0; break;
	case 11: iRank1 = 0; break;
	case 12: iRank1 = -3; break;
	case 13: iRank1 = -5; break;
	case 14: iRank1 = -4; break;
	case 15: iRank1 = -7; break;
	case 16: iRank1 = 0; break;
	case 17: iRank1 = -1; break;
	case 18: iRank1 = -3; break;
	case 19: iRank1 = -4; break;
	case 20: iRank1 = -3; break;
	case 21: iRank1 = -2; break;
	case 22: iRank1 = -1; break;
	case 23: iRank1 = -4; break;
	case 24: iRank1 = 0; break;
	case 25: iRank1 = 0; break;
	case 26: iRank1 = 0; break;
	case 27: iRank1 = -1; break;
	case 28: iRank1 = -2; break;
	case 29: iRank1 = -3; break;
	case 30: iRank1 = -4; break;
	case 31: iRank1 = -3; break;
	case 32: iRank1 = -6; break;
	case 33: iRank1 = -5; break;
	case 34: iRank1 = -6; break;
	case 35: iRank1 = -5; break;
	case 36: iRank1 = 0; break;
	case 37: iRank1 = 0; break;
	case 38: iRank1 = 0; break;
	case 39: iRank1 = 0; break;
	case 40: iRank1 = 0; break;
	case 41: iRank1 = 0; break;
	}
return iRank1;
	
}

int GetShieldPenalty(object oPC1)
{

object oShield = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC1);

if (oShield == OBJECT_INVALID)
{return 0;}

int iShieldType = GetArmorRulesType(oShield);
int iRank2;
	switch (iShieldType)
	{
	case 0: iRank2 = 0; break;
	case 9: iRank2 = -1; break;
	case 10: iRank2 = -2; break;
	case 11: iRank2 = -10; break;
	case 36: iRank2 = 0; break;
	case 37: iRank2 = -1; break;
	case 38: iRank2 = -9; break;
	case 39: iRank2 = 0; break;
	case 40: iRank2 = 0; break;
	case 41: iRank2 = -7; break;
	}
return iRank2;
}

void main()
{
object oUsed = GetLastUsedBy();
int iSwimDC = GetLocalInt(OBJECT_SELF, "SJC_SWIM_DC");
object oSuccessPoint = GetObjectByTag(GetLocalString(OBJECT_SELF, "SJC_SWIM_LOCSUCCESS"));
location lSuccessPoint = GetLocation(oSuccessPoint);
int iSwimDistance = GetLocalInt(OBJECT_SELF, "SJC_SWIM_DISTANCE");
string sDistance = IntToString(iSwimDistance);
// Get the level of skill the PC has and double armour penalties
int iRank = GetSkillRank(SKILL_SWIM, oUsed);
int iArmourPenalty = GetArmourPenalty(oUsed);
int iShieldPenalty = GetShieldPenalty(oUsed); 
iRank = iRank + iArmourPenalty + iShieldPenalty; 


//Debug	
//string sPenalty = IntToString(iRank);
//FloatingTextStringOnCreature(sPenalty, oUsed);
	
if (iRank + 10 >= iSwimDC)
{
DisplayMessageBox(oUsed, 1, "[OOC: You can Take 10] This looks easy! Do you want to continue?", "gui_sjc_doswim", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");	
}

else
{
DisplayMessageBox(oUsed, 1, "You don't think there's any way you can manage this under the present circumstances without drowning.", "", "", 0, "SCREEN_MESSAGEBOX_DEFAULT", 1, "OK", 1, "no");
}

}	