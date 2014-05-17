// sjc_onused_balancepoint
// OnUsed event script for Balance Point
// Teric neDhalir 141109
// 
#include "acr_i"

void main()
{
object oUsed = GetLastUsedBy();
int iBalanceDC = GetLocalInt(OBJECT_SELF, "SJC_BALANCE_DC");
object oSuccessPoint = GetObjectByTag(GetLocalString(OBJECT_SELF, "SJC_BALANCE_LOCSUCCESS"));
location lSuccessPoint = GetLocation(oSuccessPoint);
object oFailPoint = GetObjectByTag(GetLocalString(OBJECT_SELF, "SJC_BALANCE_LOCFAIL"));
location lFailPoint = GetLocation(oFailPoint);
int iBalanceDistance = GetLocalInt(OBJECT_SELF, "SJC_BALANCE_DISTANCE");
string sDistance = IntToString(iBalanceDistance);
// Get the level of skill the PC has, plus any bonuses
int iRank = GetSkillRank(SKILL_BALANCE, oUsed);

//if (GetSkillRank(SKILL_TUMBLE, oUsed) >= 5)
//	{
//	iRank = iRank + 2;
//	}

if (iRank + 10 >= iBalanceDC)
{
DisplayMessageBox(oUsed, 1, "[OOC: You can Take 10] This looks easy! Do you want to continue?", "gui_sjc_dobalance", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");	
}

else if (iRank + 20 < iBalanceDC)
{
DisplayMessageBox(oUsed, 1, "You don't think there's any way you can manage this under the present circumstances. Try anyway?", "", "gui_sjc_dobalance", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");
}

else
{
DisplayMessageBox(oUsed, 1, "You think you might be able to succeed in the attempt. Rolls required; " + sDistance + " Continue?", "gui_sjc_dobalance", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");
}

}	