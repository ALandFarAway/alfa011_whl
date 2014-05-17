
void main()
{

object oPC = GetLastUsedBy();




object oTarget = GetObjectByTag("009_liftexit");

location lTarget = GetLocation(oTarget);

AssignCommand(oPC, ClearAllActions());

AssignCommand(oPC, ActionJumpToLocation(lTarget));

}