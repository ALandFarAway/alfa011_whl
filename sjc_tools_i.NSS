// sjc_tools_i
// WHL generic include for custom functions
// Teric 5/10/10

#include "X0_I0_PARTYWIDE"
#include "acr_xp_i"


void SJC_GivePseudoDMXP(object oPC, int iCR, int iHours)
{
	int iAvLevel = GetFactionAverageLevel(oPC);
	int iPartySize = GetNumberPartyMembers(oPC);
	int iPartyCR = (iAvLevel * iPartySize) / 4;
	
	int iReward;
	
	if (iPartyCR >= (iCR + 4))
		{
		iReward = 50;
		}
	
	else if (iPartyCR >= (iCR + 2))
		{
		iReward = 70;
		}
	
	else if (iPartyCR <= (iCR - 2))
		{
		iReward = 110;
		}
		
	else
		{
		iReward = 90;
		}
		

    object oPartyMember = GetFirstFactionMember(oPC, TRUE);
    while(GetIsObjectValid(oPartyMember) == TRUE)
    {
		int iTotalReward = iReward * iHours;
		ACR_AwardStaticQuestXP(oPartyMember, "pseudodm", iTotalReward);
        oPartyMember = GetNextFactionMember(oPC, TRUE);
    }
	
	

}