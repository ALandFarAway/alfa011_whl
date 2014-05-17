// sjc_onused_jumppoint
// OnUsed event script for Jump Point
// Teric neDhalir 111109
// 
#include "acr_i"

void main()
{
object oUsed = GetLastUsedBy();
int iJumpDC = GetLocalInt(OBJECT_SELF, "SJC_JUMP_DC");
object oSuccessPoint = GetObjectByTag(GetLocalString(OBJECT_SELF, "SJC_JUMP_LOCSUCCESS"));
location lSuccessPoint = GetLocation(oSuccessPoint);
object oFailPoint = GetObjectByTag(GetLocalString(OBJECT_SELF, "SJC_JUMP_LOCFAIL"));
location lFailPoint = GetLocation(oFailPoint);
// Get the level of skill the PC has, plus any bonuses
int iRank = GetSkillRank(SKILL_JUMP, oUsed);

//if (GetRacialType(oUsed) == RACIAL_TYPE_HALFLING)
//	{
//	iRank = iRank + 2;
//	}
	
//if (GetSkillRank(SKILL_TUMBLE, oUsed) >= 5)
//	{
//	iRank = iRank + 2;
//	}

if (iRank + 10 >= iJumpDC)
{
DisplayMessageBox(oUsed, 1, "[OOC: You can Take 10] This looks easy! Do you want to continue?", "gui_sjc_dojump", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");	
}

else if (iRank + 20 < iJumpDC)
{
DisplayMessageBox(oUsed, 1, "You don't think there's any way you can manage this under the present circumstances. Try anyway?", "gui_sjc_dojump", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");
}

else
{
DisplayMessageBox(oUsed, 1, "You think you might be able to succeed in the attempt. Continue?", "gui_sjc_dojump", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");
}

}	