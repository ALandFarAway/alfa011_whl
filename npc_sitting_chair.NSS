
// Put this OnPerception.  Even DMs need to be visible to function. 
// Will make NPC sit on a chair they spawn over.  Set WP so the upright is the middle of their body 
// Will abort (do nothing) if fighting or talking or if no PCs are in the area.


//#include "acr_spawn_i"
void main()
{
	if (GetLocalInt(GetModule(),"Stop Ambient Life"))
	{
		return;
	}
    
	PlayCustomAnimation(OBJECT_SELF,"sitfidget", 1);

		SetOrientOnDialog(OBJECT_SELF,FALSE);//keeps NPC from turning when talked too
		SetBumpState(OBJECT_SELF,BUMPSTATE_UNBUMPABLE); //keeps NPC from being bumped and standing	
}