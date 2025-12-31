/*  onenter_qst_onion  
this is to spawn the onion plants for "4n_qst4_venison_stew" quest    */

//Put this script OnEnter


void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRY4n_qst4_venison_stew");

if (nInt < 1)
   return;
else if (nInt > 1)
   return;

object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("wp_onion_spawn1");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "011_4n_qst_venison_onion", lTarget);

oTarget = GetWaypointByTag("wp_onion_spawn2");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "011_4n_qst_venison_onion", lTarget);

oTarget = GetWaypointByTag("wp_onion_spawn3");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "011_4n_qst_venison_onion", lTarget);

oTarget = GetWaypointByTag("wp_onion_spawn4");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "011_4n_qst_venison_onion", lTarget);

oTarget = GetWaypointByTag("wp_onion_spawn5");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "011_4n_qst_venison_onion", lTarget);

oTarget = GetWaypointByTag("wp_onion_spawn6");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "011_4n_qst_venison_onion", lTarget);

}
