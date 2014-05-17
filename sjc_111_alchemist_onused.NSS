#include "acr_db_persist_i"
#include "acr_xp_i"
#include "acr_i"


void main()
{
int iDay = GetCalendarDay();
object oPC = GetLastUsedBy();
int iDoneStatic = GetLocalInt(oPC, "111_DoneStatic");
object oPuffPoint = GetObjectByTag("111_explosion");
location lLocation =  GetLocation(oPuffPoint);
effect ePuff = EffectNWN2SpecialEffectFile("sjc_alchemicalpuff");

if (GetItemPossessedBy(oPC, "011_sjc_roseannelist") == OBJECT_INVALID)
	{
	FloatingTextStringOnCreature("You see a workbench covered in retorts, powders and other alchemical necessities." , oPC, FALSE, 5.0f);
	return;
	}


if (iDoneStatic == iDay)
	{
	FloatingTextStringOnCreature("You have already worked on some items today. Please try again tomorrow", oPC, FALSE, 5.0f);
	return;
	}

if (GetIsSkillSuccessful(oPC, SKILL_CRAFT__ALCHEMY, 20, TRUE))
	{
	PlaySound("as_mg_frstmagic1");
	FloatingTextStringOnCreature("Craft Alchemy: Success. You have successfully created some basic alchemical ingredients for Roseanne.", oPC, FALSE, 5.0f);
	CreateItemOnObject("011_sjc_111_ingredients", oPC, 1, "", 1);
	SetLocalInt(oPC, "111_DoneStatic", iDay);
	}

else
	{
	ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePuff, lLocation);
	FloatingTextStringOnCreature("Craft Alchemy:Failure. You have failed to make the required ingredients (and made an awful mess). Please try again tomorrow.", oPC, FALSE, 5.0f);
	SetLocalInt(oPC, "111_DoneStatic", iDay);
	}
	
} 