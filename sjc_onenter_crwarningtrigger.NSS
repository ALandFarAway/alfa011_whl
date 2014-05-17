#include "X0_I0_PARTYWIDE"

void main()

{
	object oPC = GetEnteringObject();
	if (GetLocalInt(oPC, "sWarning") == 1)
	{
	return;
	}
	
	string sWarning = GetLocalString(OBJECT_SELF, "WARNING_TAG");
	int iCRLevel = GetLocalInt(OBJECT_SELF, "SJC_CRWARNING");
	float fCRLevel = IntToFloat(iCRLevel);
	int iAvLevel = GetFactionAverageLevel(oPC);
	float fAvLevel = IntToFloat(iAvLevel);
	int iPartySize = GetNumberPartyMembers(oPC);
	float fPartySize = IntToFloat(iPartySize);
	float fPartyCR = (fAvLevel * fPartySize) / 4;

	SetLocalIntOnAll(oPC, "sWarning", 1);
	
	if ((fCRLevel - 6) > fPartyCR)
	{
	FloatingTextStringOnCreature("You and your friends are seized with a sudden premonition of death. You think you should turn back. Now.", oPC, TRUE, 5.0f);
	return;
	}

	if ((fCRLevel - 4) > fPartyCR)
	{
	FloatingTextStringOnCreature("You and your friends feel your bravery ebbing away. Perhaps it would be better to make discretion the better part of valour?", oPC, TRUE, 5.0f);
	return;
	}

	if ((fCRLevel - 2) > fPartyCR)
	{
	FloatingTextStringOnCreature("You and your friends feel uneasy about the trials ahead and start to wish that you were more experienced.", oPC, TRUE, 5.0f);
	return;
	}

}