// gui_sjc_dobalance
// Calculate whether a balance movement is successful and move PC to success or failure point, doing damage if appropriate
// Teric neDhalir 141109
//
#include "acr_i"

void DoBalance(int iRank1, int iBalanceDC1, int iDistance1, location lSuccessPoint1, location lFailPoint1, int iDamage1, object oBalancer)
{
effect eKnockdown = EffectKnockdown();
int iCounter = GetLocalInt(GetNearestObjectByTag("sjc_balance_point"), "DISTANCECOUNTER");
if ((iRank1 + d20()) >= iBalanceDC1)
		{
		iCounter = iCounter + 1;
		SetLocalInt(GetNearestObjectByTag("sjc_balance_point"), "DISTANCECOUNTER", iCounter);
		if (iCounter == iDistance1)
		{
		AssignCommand(oBalancer, JumpToLocation(lSuccessPoint1));
		FloatingTextStringOnCreature("Success!", oBalancer, 1);
		SetLocalInt(GetNearestObjectByTag("sjc_balance_point"), "DISTANCECOUNTER", 0);
		return;
		}
		else
		{
		FloatingTextStringOnCreature("You keep your balance and move forward", oBalancer, 1);
		}
		}
else if (((iRank1 + d20()) < iBalanceDC1) && ((iRank1 + d20()) > (iBalanceDC1 - 4)))
		{
		FloatingTextStringOnCreature("You keep your balance but make no progress", oBalancer, 1);
		}
else
	{
	AssignCommand(oBalancer, JumpToLocation(lFailPoint1));
	FloatingTextStringOnCreature("You have lost your balance and fallen", oBalancer, 1);
	DelayCommand(0.5f,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oBalancer, 3.0f));
	effect eFallDamage = EffectDamage(iDamage1, DAMAGE_TYPE_BLUDGEONING);
	DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_INSTANT, eFallDamage, oBalancer));
	SetLocalInt(GetNearestObjectByTag("sjc_balance_point"), "DISTANCECOUNTER", 0);
	return;
	}
			
DelayCommand(6.0f, DoBalance(iRank1, iBalanceDC1, iDistance1, lSuccessPoint1, lFailPoint1, iDamage1, oBalancer));
}

void main()
{
// Get the info about DC and the location of where the PC goes on success or failure from
// the local variables on the balance point placeable, plus the number of rolls required.

object oBalancePoint = GetNearestObjectByTag("sjc_balance_point");
int iBalanceDC = GetLocalInt(oBalancePoint, "SJC_BALANCE_DC");
object oSuccessPoint = GetObjectByTag(GetLocalString(oBalancePoint, "SJC_BALANCE_LOCSUCCESS"));
location lSuccessPoint = GetLocation(oSuccessPoint);
object oFailPoint = GetObjectByTag(GetLocalString(oBalancePoint, "SJC_BALANCE_LOCFAIL"));
location lFailPoint = GetLocation(oFailPoint);
int iD6 = GetLocalInt(oBalancePoint, "SJC_BALANCE_D6_DAMAGE");
int iDistance = GetLocalInt(oBalancePoint, "SJC_BALANCE_DISTANCE");
int iCounter = 0;


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
int iRank = GetSkillRank(SKILL_BALANCE, OBJECT_SELF);

//	if (GetSkillRank(SKILL_TUMBLE, OBJECT_SELF) >= 5)
//	{
//	iRank = iRank + 2;
//	}
// Check for success, move to success or fail point, do damage
	if (iRank + 10 >= iBalanceDC)
	{
	float fDelay = (IntToFloat(iDistance) * 6);
	string sDelay = FloatToString(fDelay, 18, 0);
	FloatingTextStringOnCreature("Balancing (" + sDelay + " seconds)", OBJECT_SELF, 1);
	DelayCommand(fDelay, AssignCommand(OBJECT_SELF, JumpToLocation(lSuccessPoint)));	
	}

	else
	{
	FloatingTextStringOnCreature("Balancing; please wait until success, or you fall.", OBJECT_SELF, 1);
	DoBalance(iRank, iBalanceDC, iDistance, lSuccessPoint, lFailPoint, iDamage, OBJECT_SELF);
	}
	
	





}