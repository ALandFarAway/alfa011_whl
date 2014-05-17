// ga_give_xp_alfa
/*
    This gives the player some experience
        nXP     = The amount of experience given to the PC
        bAllPartyMembers = If set to 1 it gives XP to all the PCs in the party (MP only)
*/
// FAB 9/30
// MDiekmann 4/9/07 -- using GetFirst and NextFactionMember() instead of GetFirst and NextPC(), changed nAllPCs to bAllPartyMembers
#include "acr_xp_i"
void main(int nXP, int bAllPartyMembers)
{
    object oPC = (GetPCSpeaker()==OBJECT_INVALID?OBJECT_SELF:GetPCSpeaker());

    if ( bAllPartyMembers == 0 ) ACR_GiveXPToPC(oPC, nXP );
    else
    {
        object oTarg = GetFirstFactionMember(oPC);
        while(GetIsObjectValid(oTarg))
        {
            ACR_AwardStaticQuestXP(oTarg, "generic", nXP );
            oTarg = GetNextFactionMember(oPC);
        }
    }

}