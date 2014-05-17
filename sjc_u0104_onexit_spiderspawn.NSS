void main()
{

int iCount = GetLocalInt(OBJECT_SELF, "PCCount");
object oExiter = GetExitingObject();

if (GetIsPC(oExiter) || GetIsDMPossessed(oExiter))
	{
	SetLocalInt(OBJECT_SELF, "PCCount", (iCount - 1));
	}
//SendMessageToPC(GetFirstPC(), IntToString(GetLocalInt(OBJECT_SELF, "PCCount")));


}