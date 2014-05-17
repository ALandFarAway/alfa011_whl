// script_name
/*
	Description:
	
*/
// Name_Date

void main()
{
object oEnterer = GetEnteringObject();
if (GetLocalInt(oEnterer, "112_drunkpotion") == 0)
	{
	AssignCommand(oEnterer, ActionJumpToObject(GetObjectByTag("112_bounce")));
	FloatingTextStringOnCreature("An invisible force pushes you back", oEnterer);
	}
}