
void main()
{

object oPC = GetLastUsedBy();

object oTarget = GetWaypointByTag("145_climbdown");

location lTarget = GetLocation(oTarget);

AssignCommand(oPC, ClearAllActions());

AssignCommand(oPC, ActionJumpToLocation(lTarget));

}