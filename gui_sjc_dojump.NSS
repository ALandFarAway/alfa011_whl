// gui_sjc_dojump
// Calculate whether a jump is successful and move PC to success or failure point, doing damage if appropriate
// Teric neDhalir 111109
//
#include "acr_i"

void main()
{
// Get the info about DC and the location of where the PC goes on success or failure from
// the local variables on the jump point placeable.

object oJumpPoint = GetNearestObjectByTag("sjc_jump_point");
int iJumpDC = GetLocalInt(oJumpPoint, "SJC_JUMP_DC");
object oSuccessPoint = GetObjectByTag(GetLocalString(oJumpPoint, "SJC_JUMP_LOCSUCCESS"));
location lSuccessPoint = GetLocation(oSuccessPoint);
object oFailPoint = GetObjectByTag(GetLocalString(oJumpPoint, "SJC_JUMP_LOCFAIL"));
location lFailPoint = GetLocation(oFailPoint);
int iD6 = GetLocalInt(oJumpPoint, "SJC_JUMP_D6_DAMAGE");
effect eKnockdown = EffectKnockdown();

int iDamage;
	if (iD6 == 0)
	{
	iDamage = 0;
	}
	else
	{
	iDamage = d6(iD6);
	}

// Get the level of skill the PC has, plus any bonuses
int iRank = GetSkillRank(SKILL_JUMP, OBJECT_SELF);

//	if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HALFLING)
//	{
//	iRank = iRank + 2;
//	}
	
//	if (GetSkillRank(SKILL_TUMBLE, OBJECT_SELF) >= 5)
//	{
//	iRank = iRank + 2;
//	}
// Check for success, move to success or fail point, do damage
	if (iRank + 10 >= iJumpDC)
	{
	AssignCommand(OBJECT_SELF, JumpToLocation(lSuccessPoint));
	FloatingTextStringOnCreature("Success!", OBJECT_SELF, 1);	
	}

	else
	{
		if (iRank + d20() >= iJumpDC)
		{
		AssignCommand(OBJECT_SELF, JumpToLocation(lSuccessPoint));
		FloatingTextStringOnCreature("Success!", OBJECT_SELF, 1);
		}
		else
		{
		AssignCommand(OBJECT_SELF, JumpToLocation(lFailPoint));
		FloatingTextStringOnCreature("You failed to make the jump.", OBJECT_SELF, 1);
		DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, OBJECT_SELF, 3.0f));
	    effect eFallDamage = EffectDamage(iDamage, DAMAGE_TYPE_BLUDGEONING);
		DelayCommand(0.5f,ApplyEffectToObject(DURATION_TYPE_INSTANT, eFallDamage, OBJECT_SELF));
		}
	
	
	}





}