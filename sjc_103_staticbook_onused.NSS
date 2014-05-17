#include "acr_db_persist_i"
#include "acr_xp_i"


void main()
{
int iDay = GetCalendarDay();
object oPC = GetLastUsedBy();
int iDoneStatic = GetLocalInt(oPC, "103_DoneStatic");
int iCreditBanked = ACR_GetPersistentInt(oPC, "103_creditbanked");

if (GetItemPossessedBy(oPC, "011_sjc_caruthcontract") == OBJECT_INVALID)
	{
	FloatingTextStringOnCreature("You see an old book full of arcane writing." , oPC, FALSE, 5.0f);
	return;
	}


if (iDoneStatic == iDay)
	{
	FloatingTextStringOnCreature("You have already worked on the transcription today. Please try again tomorrow", oPC, FALSE, 5.0f);
	return;
	}

if (GetIsSkillSuccessful(oPC, SKILL_SPELLCRAFT, 20, FALSE))
	{
	int iNewAmountBanked = iCreditBanked + 15;
	string sNewAmountBanked = IntToString(iNewAmountBanked);
	FloatingTextStringOnCreature("Spellcraft:Success. You have successfully transcribed a page of the book", oPC, FALSE, 5.0f);
	FloatingTextStringOnCreature("You now have " + sNewAmountBanked + " gold pieces banked" , oPC, FALSE, 5.0f);
	ACR_SetPersistentInt(oPC, "103_creditbanked", iNewAmountBanked, 0);
	ACR_AwardStaticQuestXP(oPC, "staticbook", 15);
	SetLocalInt(oPC, "103_DoneStatic", iDay);
	}

else
	{
	FloatingTextStringOnCreature("Spellcraft:Failure. You make a mistake while copying the page. Please try again tomorrow.", oPC, FALSE, 5.0f);
	SetLocalInt(oPC, "103_DoneStatic", iDay);
	}
	
} 