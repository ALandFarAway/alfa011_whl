//Put this script OnEnter
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

if (GetStringLowerCase(GetDeity(oPC))!="Helm")
   return;

object oTarget;
oTarget = GetObjectByTag("dr_9q_tmpl_lvl1_lvl2c");

SetLocked(oTarget, FALSE);

AssignCommand(oTarget, ActionOpenDoor(oTarget));

}
