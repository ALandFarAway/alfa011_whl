// gui_sjc_dosqueeze
// Calculate whether a PC can squeeze through a narrow gap, prison bars, etc
// Teric neDhalir 111109
//
#include "acr_i"

void main()
{
// Get the info about DC and the location of where the PC goes on success or failure from
// the local variables on the squeeze point placeable.

object oSqueezePoint = GetNearestObjectByTag("sjc_squeeze_point");
int iSqueezeDC = GetLocalInt(oSqueezePoint, "SJC_SQUEEZE_DC");
object oSuccessPoint = GetObjectByTag(GetLocalString(oSqueezePoint, "SJC_SQUEEZE_LOCSUCCESS"));
location lSuccessPoint = GetLocation(oSuccessPoint);


// Get the level of skill the PC has, plus any bonuses
int iRank = GetSkillRank(SKILL_ESCAPE_ARTIST, OBJECT_SELF);

if (GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_SMALL)
	{
	iRank = iRank + 4;
	}
	
if (GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_TINY)
	{
	iRank = iRank + 8;
	}
	
if (GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_LARGE)
	{
	iRank = iRank - 4;
	}
	
if (GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_HUGE)
	{
	iRank = iRank - 8;
	}

// Check for success, move to success point or tell PC they've failed.
	if (iRank + 10 >= iSqueezeDC)
	{
	AssignCommand(OBJECT_SELF, JumpToLocation(lSuccessPoint));
	FloatingTextStringOnCreature("Success!", OBJECT_SELF, 1);	
	}

	else
	{
		if (iRank + d20() >= iSqueezeDC)
		{
		AssignCommand(OBJECT_SELF, JumpToLocation(lSuccessPoint));
		FloatingTextStringOnCreature("Success!", OBJECT_SELF, 1);
		}
		else
		{
		FloatingTextStringOnCreature("You twist and turn, but can not get through.", OBJECT_SELF, 1);
		}
	
	
	}





}