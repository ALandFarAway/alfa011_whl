void main()
	{
	object oPC=GetLastUsedBy();
	object oChair=OBJECT_SELF;
	AssignCommand(oPC,ActionJumpToLocation(GetLocation(oChair)));
	PlayCustomAnimation(oPC,"sitidle",1,1.0);
	} 



/*#include "x0_i0_position"

void main()
{

	object oChair = OBJECT_SELF;
	object oUser = GetLastUsedBy();
	object oLastUser = GetLocalObject(oChair, "pl_lastuser");

	float fOtherDis = 0.0;
	float fOtherAgl = 0.0;	
	

		if( ( GetArea(oLastUser) != GetArea(oChair) ) ||
		(GetDistanceBetween(oLastUser, oChair) >= 0.25) ||
		(oLastUser == oUser) )
		{
			AssignCommand(oUser, ActionMoveToLocation(Location(GetArea(oChair),GetChangedPosition(GetChangedPosition(GetPosition(oChair),GetLocalFloat(oChair, "pl_adjdis"),GetNormalizedDirection(GetFacing(oChair)+GetLocalFloat(oChair, "pl_adjagl")+GetLocalFloat(oChair,"pl_rotate"))),fOtherDis,GetNormalizedDirection(fOtherAgl+GetLocalFloat(oChair,"pl_rotate"))),0.0)));
			DelayCommand(1.5, AssignCommand(oUser, SetFacing( GetNormalizedDirection(GetFacing(oChair)+180.0+GetLocalFloat(oChair,"pl_rotate")) )));
			DelayCommand(2.5, ExecuteScript("pl_sitanimation", oUser));
			SetLocalObject(oChair, "pl_lastuser", oUser);
		}

}*/