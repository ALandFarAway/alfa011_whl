void main()
{
object oPC = GetEnteringObject();
if (!GetIsPC(oPC)) return;
// Set lowest and highest levels allowed
int iLow = GetLocalInt(OBJECT_SELF, "SJC_LEVELMIN");
int iHigh = GetLocalInt(OBJECT_SELF, "SJC_LEVELMAX");
string sLow = IntToString(iLow);
string sHigh = IntToString(iHigh);
// Tag of waypoint to boot to
string sBootPoint = GetLocalString(OBJECT_SELF, "SJC_BOOTPOINT");
// Get PC Level
int iPCLevel = GetHitDice(oPC);

if (iPCLevel < iLow || iPCLevel > iHigh)
	{
	object oTarget = GetWaypointByTag(sBootPoint);
	location lTarget = GetLocation(oTarget);
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionJumpToLocation(lTarget));
	DisplayMessageBox(oPC, 1, "Sorry, this area is for levels " + sLow + " to " + sHigh + " only. If you are currently in a party please leave it.");
	}













}