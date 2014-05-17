
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

if ((GetLevelByClass(CLASS_TYPE_DRUID, oPC)==0))
   return;

FloatingTextStringOnCreature("You sense that this place is consecrated to the gods of Nature.", oPC, FALSE);

}