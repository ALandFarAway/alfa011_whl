
// Put this OnPerception.
//  Will make NPC sit on the ground crosslegged  sitgrounddown sitgroundidle	
// Will abort (do nothing) if fighting or talking or if no PCs are in the area.


void main()
{
	if (GetLocalInt(GetModule(),"Stop Ambient Life"))
	{
		return;
	}

	int nRandom=Random(1);
	if (nRandom==0)

	PlayCustomAnimation(OBJECT_SELF,"sitgroundidle", 1);
		SetOrientOnDialog(OBJECT_SELF,FALSE);//keeps NPC from turning when talked too
		SetBumpState(OBJECT_SELF,BUMPSTATE_UNBUMPABLE); //keeps NPC from being bumped and standing
	//	AssignCommand(oNPC, ActionPlayAnimation(sitgroundidle));
	
}