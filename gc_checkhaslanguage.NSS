#include "dmfi_inc_langexe"

int StartingConditional(string sLang)
{
object oPC = GetPCSpeaker();
//string sLang = GetStringLowerCase(sLang);
if (DMFI_IsLanguageKnown(oPC, sLang) == TRUE) return TRUE;
return FALSE;
}