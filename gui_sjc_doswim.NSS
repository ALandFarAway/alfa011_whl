// gui_sjc_doswim
// Move PC between waypoints on successful use of Swim skill
// Teric neDhalir 191109
//

void main()
{
// The swim roll is a success on "Take 10", so if you've got this far just move the PC
// 
object oSwimPoint = GetNearestObjectByTag("sjc_swim_point");
object oSuccessPoint = GetObjectByTag(GetLocalString(oSwimPoint, "SJC_SWIM_LOCSUCCESS"));
location lSuccessPoint = GetLocation(oSuccessPoint);
int iDistance = GetLocalInt(oSwimPoint, "SJC_SWIM_DISTANCE");

float fDelay = (IntToFloat(iDistance) * 6);
string sDelay = FloatToString(fDelay, 18, 0);
FloatingTextStringOnCreature("Swimming (" + sDelay + " seconds)", OBJECT_SELF, 1);
DelayCommand(fDelay, AssignCommand(OBJECT_SELF, JumpToLocation(lSuccessPoint)));




}