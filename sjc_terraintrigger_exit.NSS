void main()
{
object oExiting = GetExitingObject();
if (!GetIsPC(oExiting)) return;
if (GetIsDM(oExiting) | GetIsDMPossessed(oExiting)) return;
SetLocalString(oExiting, "sjc_terraintype", "None");
}