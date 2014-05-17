// sjc_onused_climbpoint_up
// OnUsed event script for Climb Point (UP)
// Teric neDhalir 151109
// 
#include "acr_i"

void main()
{
object oUsed = GetLastUsedBy();
int iClimbDC = GetLocalInt(OBJECT_SELF, "SJC_CLIMB_DC");
object oSuccessPoint = GetObjectByTag(GetLocalString(OBJECT_SELF, "SJC_CLIMB_LOCSUCCESS"));
location lSuccessPoint = GetLocation(oSuccessPoint);
object oFailPoint = GetObjectByTag(GetLocalString(OBJECT_SELF, "SJC_CLIMB_LOCFAIL"));
location lFailPoint = GetLocation(oFailPoint);
int iClimbDistance = GetLocalInt(OBJECT_SELF, "SJC_CLIMB_DISTANCE");
string sDistance = IntToString(iClimbDistance);
// Get the level of skill the PC has, plus any bonuses
int iRank = GetSkillRank(SKILL_CLIMB, oUsed);

//if (GetRacialType(oUsed) == RACIAL_TYPE_HALFLING)
//	{
//	iRank = iRank + 2;
//	}

if (iRank + 10 >= iClimbDC)
{
DisplayMessageBox(oUsed, 1, "[OOC: You can Take 10] This looks easy! Do you want to continue?", "gui_sjc_doclimb_up", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");	
}

else if (iRank + 20 < iClimbDC)
{
DisplayMessageBox(oUsed, 1, "You don't think there's any way you can succeed under the present circumstances. Try anyway?", "gui_sjc_doclimb_up", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");
}

else
{
DisplayMessageBox(oUsed, 1, "You think you might be able to succeed in the attempt. Rolls required; " + sDistance + " Continue?", "gui_sjc_doclimb_up", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");
}

}	