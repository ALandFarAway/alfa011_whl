#include "acr_db_persist_i"

void main()
{

object oPC = GetClickingObject();

if (!GetIsPC(oPC)) return;

location lTarget = GetLocalLocation(oPC, "sjc_encounterpoint");


AssignCommand(oPC, ClearAllActions());

AssignCommand(oPC, ActionJumpToLocation(lTarget));

}