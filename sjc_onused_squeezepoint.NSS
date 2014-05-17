// sjc_onused_squeezepoint
// OnUsed event script for Squeeze Point
// Teric neDhalir 121109
// 
#include "acr_i"

void main()
{
object oUsed = GetLastUsedBy();
int iSqueezeDC = GetLocalInt(OBJECT_SELF, "SJC_SQUEEZE_DC");
object oSuccessPoint = GetObjectByTag(GetLocalString(OBJECT_SELF, "SJC_SQUEEZE_LOCSUCCESS"));
location lSuccessPoint = GetLocation(oSuccessPoint);

// Get the level of skill the PC has, plus any bonuses
int iRank = GetSkillRank(SKILL_ESCAPE_ARTIST, oUsed);

if (GetCreatureSize(oUsed) == CREATURE_SIZE_SMALL)
	{
	iRank = iRank + 4;
	}
	
if (GetCreatureSize(oUsed) == CREATURE_SIZE_TINY)
	{
	iRank = iRank + 8;
	}
	
if (GetCreatureSize(oUsed) == CREATURE_SIZE_LARGE)
	{
	iRank = iRank - 4;
	}
	
if (GetCreatureSize(oUsed) == CREATURE_SIZE_HUGE)
	{
	iRank = iRank - 8;
	}

if (iRank + 10 >= iSqueezeDC)
{
DisplayMessageBox(oUsed, 1, "[OOC: You can Take 10] This looks easy! Do you want to continue?", "gui_sjc_dosqueeze", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");	
}

else if (iRank + 20 < iSqueezeDC)
{
DisplayMessageBox(oUsed, 1, "You don't think there's any way you can manage this under the present circumstances. Try anyway?", "gui_sjc_dosqueeze", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");
}

else
{
DisplayMessageBox(oUsed, 1, "You think you might be able to succeed in the attempt. Continue?", "gui_sjc_dosqueeze", "", 1, "SCREEN_MESSAGEBOX_DEFAULT", 1, "yes", 1, "no");
}

}	