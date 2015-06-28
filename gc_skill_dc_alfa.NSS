// gc_skill_dc(int nSkill, int nDC)
/*
	Determine if PC Speaker's skill roll is successful.
	
	Parameters:
		int nSkill 	= skill int to check
		int nDC		= difficulty class to beat
	
	Remarks:
		skill ints
		0	APPRAISE
		1	BLUFF
		2	CONCENTRATION
		3	CRAFT ALCHEMY
		4	CRAFT ARMOR
		5	CRAFT WEAPON
		6	DIPLOMACY
		7	DISABLE DEVICE
		8	DISCIPLINE
		9	HEAL
		10	HIDE
		11	INTIMIDATE
		12	LISTEN
		13	LORE
		14	MOVE SILENTLY
		15	OPEN LOCK
		16	PARRY
		17	PERFORM
		18	RIDE
		19	SEARCH
		20	CRAFT TRAP
		21	SLEIGHT OF HAND
		22	SPELL CRAFT
		23	SPOT
		24	SURVIVAL
		25	TAUNT
		26	TUMBLE
		27	USE MAGIC DEVICE
//const int SKILL_BALANCE = 30;
//const int SKILL_CLIMB = 31;
//const int SKILL_CRAFT__ALCHEMY = 64;
//const int SKILL_CRAFT_ARMORSMITHING = 65;
//const int SKILL_CRAFT_BOWMAKING = 66;
//const int SKILL_CRAFT_WEAPONSMITHING = 67;
//const int SKILL_DECIPHER_SCRIPT = 32;
//const int SKILL_DISGUISE = 34;
//const int SKILL_ESCAPE_ARTIST = 35;
//const int SKILL_FORGERY = 36;
//const int SKILL_GATHER_INFORMATION = 37;
//const int SKILL_HANDLE_ANIMAL = 38;
//const int SKILL_JUMP = 39;
//const int SKILL_KNOWLEDGE_ARCANA = 40;
//const int SKILL_KNOWLEDGE_DUNGEONEERING = 33;
//const int SKILL_KNOWLEDGE_ENGINEERING = 58;
//const int SKILL_KNOWLEDGE_GEOGRAPHY = 55;
//const int SKILL_KNOWLEDGE_HISTORY = 41;
//const int SKILL_KNOWLEDGE_LOCAL = 59;
//const int SKILL_KNOWLEDGE_NATURE = 42;
//const int SKILL_KNOWLEDGE_NOBILITY = 56;
//const int SKILL_KNOWLEDGE_RELIGION = 43;
//const int SKILL_KNOWLEDGE_THE_PLANES = 44;
//const int SKILL_PERFORM_ACT = 45;
//const int SKILL_PERFORM_COMEDY = 63;
//const int SKILL_PERFORM_DANCE = 46;
//const int SKILL_PERFORM_KEYBOARD = 61;
//const int SKILL_PERFORM_ORATORY = 47;
//const int SKILL_PERFORM_PERCUSSION = 60;
//const int SKILL_PERFORM_STRING_INSTRUMENTS = 48;
//const int SKILL_PERFORM_SING = 49;
//const int SKILL_PERFORM_WIND_INSTRUMENTS = 62;
//const int SKILL_PROFESSION = 50;
//const int SKILL_SENSE_MOTIVE = 51;
//const int SKILL_SPEAK_LANGUAGE = 52;
//const int SKILL_SWIM = 53;
//const int SKILL_USE_ROPE = 54;
*/
// BMA-OEI 9/02/05

#include "ginc_param_const"
#include "acr_i"

int StartingConditional(int nSkill, int nDC)
{
	object oPC = GetPCSpeaker();
	//int nSkillVal = GetSkillConstant(nSkill);
	
	if (GetIsSkillSuccessful(oPC, nSkill, nDC, TRUE) == TRUE)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}