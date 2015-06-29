//Set a persistent int variable on the PC Speaker

#include "acr_db_persist_i"

void main(string sVariable, int iValue)
{
object oPC = GetPCSpeaker();
ACR_SetPersistentInt(oPC, sVariable, iValue, 0);
}