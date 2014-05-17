// Rumour Trigger
/*
	Description:
	Checks whether PC is withing defined level range and passes the string for the rumour OnEnter
*/
// Teric neDhalir 180413

void main()
{
string sTag = GetTag(OBJECT_SELF);
object oPC = GetEnteringObject();
string sRumour = GetLocalString(OBJECT_SELF, "SJC_RUMOURTEXT");
int iLevel = GetHitDice(oPC);
int iMinLevel = GetLocalInt(OBJECT_SELF, "SJC_LEVELMIN");
int iMaxLevel = GetLocalInt(OBJECT_SELF, "SJC_LEVELMAX");

if (!GetIsPC(oPC)) return;

if (GetLocalInt(oPC, "RumourHeard" + sTag) == 1)
	{
	return;
	}
	
if (iLevel >= iMinLevel && iLevel <= iMaxLevel)
	{	
	SetLocalInt(oPC, "RumourHeard" + sTag, 1);
	DisplayMessageBox(oPC, 1, sRumour);
	}
	
}