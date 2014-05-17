//
/*
iScrollcost = cost of scroll in gp
sScrolltag = tag of scroll to be given

*/
//


#include "acr_db_persist_i"

void main(int iScrollcost, string sScrolltag)
{
object oPC = GetPCSpeaker();
int iBanked = ACR_GetPersistentInt(oPC, "103_creditbanked");

CreateItemOnObject(sScrolltag, oPC);
int iNewBanked = (iBanked - iScrollcost);
ACR_SetPersistentInt(oPC, "103_creditbanked", iNewBanked, 0);

}