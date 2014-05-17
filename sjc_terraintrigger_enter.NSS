void main()
{
object oEntering = GetEnteringObject();
if (!GetIsPC(oEntering)) return;
if (GetIsDM(oEntering) | GetIsDMPossessed(oEntering)) return;
string sTerrain = GetLocalString(OBJECT_SELF, "TriggerTerrainType");
SetLocalString(oEntering, "sjc_terraintype", sTerrain);
int iPercentage = GetLocalInt(OBJECT_SELF, "EncounterPercentage");
SetLocalInt(oEntering, "sjc_encounterpercentage", iPercentage);
}