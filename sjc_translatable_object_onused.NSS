////////////

///////////
#include "dmfi_inc_langexe" 
void main()
{
string sLang = GetLocalString(OBJECT_SELF, "SJC_PLC_LANG");
string sSuccess = GetLocalString(OBJECT_SELF, "SJC_TRANSLATED_TEXT");
string sFail = GetLocalString(OBJECT_SELF, "SJC_FAILED_TEXT");
object oPC = GetLastUsedBy();

if (DMFI_IsLanguageKnown(oPC, sLang) == TRUE)
{DisplayMessageBox(oPC, 1, sSuccess);}
else
{DisplayMessageBox(oPC, 1, sFail);}
}
	