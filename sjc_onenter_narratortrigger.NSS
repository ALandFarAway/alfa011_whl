void main()
{
object oPC = GetEnteringObject();
if (!GetIsPC(oPC)) return;

int iCount = GetLocalInt(OBJECT_SELF, "numberentered");
string sTag = GetLocalString(OBJECT_SELF, "SJC_TAGNAME");
string sObject = GetLocalString(OBJECT_SELF, "SJC_OBJECTNAME");

object oSpawnPoint = GetNearestObjectByTag(sTag);
location lLocation = GetLocation(oSpawnPoint);

iCount++;
SetLocalInt(OBJECT_SELF, "numberentered", iCount);
//SendMessageToPC(GetFirstPC(), IntToString(iCount));
if (iCount == 1)
	{
	CreateObject(OBJECT_TYPE_CREATURE, sObject, lLocation);
	
	}

















}