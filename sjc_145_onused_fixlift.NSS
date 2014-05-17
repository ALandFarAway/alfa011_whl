
void main()
{

object oTarget1 = GetObjectByTag("145_exitlever");
object oTarget2 = GetObjectByTag("009_entrancelever");
SetUseableFlag(oTarget1, 1);
SetUseableFlag(oTarget2, 1);
SetUseableFlag(OBJECT_SELF, 0);

}