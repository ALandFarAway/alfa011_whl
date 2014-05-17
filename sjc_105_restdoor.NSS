void main()
{

object oPC = GetClickingObject();

if (!GetIsPC(oPC)) return;

if (GetItemPossessedBy(oPC, "011_sjc_inheroesguild")== OBJECT_INVALID)
   {
   string sDeny="You must be a Guild member to pass through this door.";

   FloatingTextStringOnCreature(sDeny, oPC, TRUE, 4.0);

   return;
   }

object oTarget;
location lTarget;
oTarget = GetWaypointByTag("sjc_105_restin");

lTarget = GetLocation(oTarget);

//only do the jump if the location is valid.
//though not flawless, we just check if it is in a valid area.
//the script will stop if the location isn't valid - meaning that
//nothing put after the teleport will fire either.
//the current location won't be stored, either

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPC, ClearAllActions());

AssignCommand(oPC, ActionJumpToLocation(lTarget));

}