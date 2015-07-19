// int SKILL_CONCENTRATION    = 1;
// int SKILL_APPRAISE         = 20;
// int SKILL_BLUFF            = 23;
// int SKILL_CONCENTRATION    = 1;
// int SKILL_CRAFT_ALCHEMY    = 27;
// int SKILL_CRAFT_ARMOR      = 25;
// int SKILL_CRAFT_TRAP       = 22;
// int SKILL_CRAFT_WEAPON     = 26;
// int SKILL_DIPLOMACY        = 12;
// int SKILL_DISABLE_TRAP     = 2;
// int SKILL_DISCIPLINE       = 3;
// int SKILL_HEAL             = 4;
// int SKILL_HIDE             = 5;
// int SKILL_INTIMIDATE       = 24;
// int SKILL_LISTEN           = 6;
// int SKILL_LORE             = 7;
// int SKILL_MOVE_SILENTLY    = 8;
// int SKILL_OPEN_LOCK        = 9;
// int SKILL_PARRY            = 10;
// int SKILL_PERFORM          = 11;
// int SKILL_RIDE             = 28;
// int SKILL_SEARCH           = 14;
// int SKILL_SET_TRAP         = 15;
// int SKILL_SLEIGHT_OF_HAND  = 13;
// int SKILL_SPELLCRAFT       = 16;
// int SKILL_SPOT             = 17;
// int SKILL_SURVIVAL         = 29;
// int SKILL_TAUNT            = 18;
// int SKILL_TUMBLE           = 21;
//int SKILL_USE_MAGIC_DEVICE = 19;
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
#include "acr_i"
#include "acr_db_persist_i"
void main()
{
object oPC = GetEnteringObject();
int iSkill = GetLocalInt(OBJECT_SELF, "SJC_SKILLNUMBER");
string sFeedback = GetLocalString(OBJECT_SELF, "SJC_FLAVOURTEXT");
int iDifficulty = GetLocalInt(OBJECT_SELF, "SJC_SKILL_DC");
int iPCNumber = ACR_GetCharacterID(oPC);
string sPCNumber = IntToString(iPCNumber);

if (!GetIsPC(oPC)) return;
if (GetLocalInt(OBJECT_SELF, "SKILLTRIGGERDONE" + sPCNumber) == 1) return;


SetLocalInt(OBJECT_SELF, "SKILLTRIGGERDONE" + sPCNumber, 1);

if (GetIsSkillSuccessful(oPC, iSkill, iDifficulty, FALSE))
	{
	DisplayMessageBox(oPC, 1, sFeedback);
	//DestroyObject(OBJECT_SELF, 0.5f);	
	}

}