#include "acr_db_persist_i"
#include "acr_xp_i"
#include "acr_i"


void main()
{
int iDay = GetCalendarDay();
object oPC = GetLastUsedBy();
int iDoneStatic = GetLocalInt(oPC, "149_DoneStatic");
//object oPuffPoint = GetObjectByTag("111_explosion");
//location lLocation =  GetLocation(oPuffPoint);
//effect ePuff = EffectNWN2SpecialEffectFile("sjc_alchemicalpuff");

if (GetItemPossessedBy(oPC, "011_149_blodvarplist") == OBJECT_INVALID)
	{
	FloatingTextStringOnCreature("You see a workbench covered in hammers, punches and files." , oPC, FALSE, 5.0f);
	return;
	}


if (iDoneStatic == iDay)
	{
	FloatingTextStringOnCreature("You have already worked on some items today. Please try again tomorrow", oPC, FALSE, 5.0f);
	return;
	}

if (GetIsSkillSuccessful(oPC, SKILL_CRAFT_WEAPONSMITHING, 20, TRUE))
	{
	PlaySound("as_cv_smithhamr1");
	FloatingTextStringOnCreature("Craft Weapon:Success. You have successfully fitted Blodvarp's axeheads to their shafts", oPC, FALSE, 5.0f);
	CreateItemOnObject("011_sjc_149_axes", oPC, 1, "", 1);
	SetLocalInt(oPC, "149_DoneStatic", iDay);
	}

else
	{
	//ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePuff, lLocation);
	PlaySound("as_cv_smithhamr1");
	FloatingTextStringOnCreature("Craft Armor:Failure. You have failed to make the required equipment. Please try again tomorrow.", oPC, FALSE, 5.0f);
	SetLocalInt(oPC, "149_DoneStatic", iDay);
	}
	
} 