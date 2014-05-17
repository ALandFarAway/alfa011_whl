// gui_sjc_doClimb_up
// Calculate whether a Climb movement is successful and move PC to success or failure point, doing damage if appropriate
// Teric neDhalir 151109
//
#include "acr_i"

void DoClimb(int iRank1, int iClimbDC1, int iDistance1, location lSuccessPoint1, location lFailPoint1, object oClimber)
{
effect eKnockdown = EffectKnockdown();
int iCounter = GetLocalInt(GetNearestObjectByTag("sjc_climb_point_up"), "DISTANCECOUNTER");
if ((iRank1 + d20()) >= iClimbDC1)
		{
		iCounter = (iCounter + 1);
		SetLocalInt(GetNearestObjectByTag("sjc_climb_point_up"), "DISTANCECOUNTER", iCounter);
		if (iCounter == iDistance1)
		{
		AssignCommand(oClimber, JumpToLocation(lSuccessPoint1));
		FloatingTextStringOnCreature("Success!", oClimber, 1);
		SetLocalInt(GetNearestObjectByTag("sjc_climb_point_up"), "DISTANCECOUNTER", 0);
		return;
		}
		else
		{
		FloatingTextStringOnCreature("You climb and move upward 10 feet.", oClimber, 1);
		}
		}
else if (((iRank1 + d20()) < iClimbDC1) && ((iRank1 + d20()) > (iClimbDC1 - 4)))
		{
		FloatingTextStringOnCreature("You hold on, but make no progress this round.", oClimber, 1);
		}
else
	{
	AssignCommand(oClimber, JumpToLocation(lFailPoint1));
	FloatingTextStringOnCreature("You have fallen!", oClimber, 1);
	DelayCommand(0.5f,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oClimber, 3.0f));
	
	int iDamage;
	int iFallDistance = (iCounter);
		if (iFallDistance == 0)
		{
		iDamage = 0;
		}
		else
		{
		iDamage = d6(iFallDistance);
		}
	
	
	
	effect eFallDamage = EffectDamage(iDamage, DAMAGE_TYPE_BLUDGEONING);
	DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_INSTANT, eFallDamage, oClimber));
	SetLocalInt(GetNearestObjectByTag("sjc_climb_point_up"), "DISTANCECOUNTER", 0);
	return;
	}
			
DelayCommand(6.0f, DoClimb(iRank1, iClimbDC1, iDistance1, lSuccessPoint1, lFailPoint1, oClimber));
}

void main()
{
// Get the info about DC and the location of where the PC goes on success or failure from
// the local variables on the Climb point placeable, plus the number of rolls required.

object oClimbPoint = GetNearestObjectByTag("sjc_climb_point_up");
int iClimbDC = GetLocalInt(oClimbPoint, "SJC_CLIMB_DC");
object oSuccessPoint = GetObjectByTag(GetLocalString(oClimbPoint, "SJC_CLIMB_LOCSUCCESS"));
location lSuccessPoint = GetLocation(oSuccessPoint);
object oFailPoint = GetObjectByTag(GetLocalString(oClimbPoint, "SJC_CLIMB_LOCFAIL"));
location lFailPoint = GetLocation(oFailPoint);
int iDistance = GetLocalInt(oClimbPoint, "SJC_CLIMB_DISTANCE");
int iCounter = 0;


// Get the level of skill the PC has, plus any bonuses
int iRank = GetSkillRank(SKILL_CLIMB, OBJECT_SELF);

//if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HALFLING)
//	{
//	iRank = iRank + 2;
//	}

// Check for success, move to success or fail point, do damage
	if (iRank + 10 >= iClimbDC)
	{
	float fDelay = (IntToFloat(iDistance) * 6);
	string sDelay = FloatToString(fDelay, 18, 0);
	FloatingTextStringOnCreature("Climbing (" + sDelay + " seconds)", OBJECT_SELF, 1);
	DelayCommand(fDelay, AssignCommand(OBJECT_SELF, JumpToLocation(lSuccessPoint)));
	//FloatingTextStringOnCreature("Success!", OBJECT_SELF, 1);	
	}

	else
	{
	FloatingTextStringOnCreature("Climbing; please wait until success, or you fall.", OBJECT_SELF, 1);
	DoClimb(iRank, iClimbDC, iDistance, lSuccessPoint, lFailPoint, OBJECT_SELF);
	}
	
	





}