void main()
{
object oPC = GetExitingObject();
if (!GetIsPC(oPC)) return;


string sObject = GetLocalString(OBJECT_SELF, "SJC_OBJECTNAME");
int iCount = GetLocalInt(OBJECT_SELF, "numberentered");
object oNarrator = GetNearestObjectByTag(sObject);

iCount--;
SetLocalInt(OBJECT_SELF, "numberentered", iCount);
SendMessageToPC(GetFirstPC(), IntToString(iCount));
if (iCount == 0)
	{
	DestroyObject(oNarrator, 0.0f, FALSE);
	//SendMessageToPC(GetFirstPC(), "destroyed?");
	}
}