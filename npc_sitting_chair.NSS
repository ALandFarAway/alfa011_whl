void main()
{
//Sits the NPC down
int nChair = 1;
object oChair;
//"NPC_CHAIR" is the tag name of the chair to be used
oChair = GetNearestObjectByTag("NPC_CHAIR", OBJECT_SELF, nChair);
ActionSit(oChair);
SetOrientOnDialog(OBJECT_SELF,FALSE);//keeps NPCs from turning to face PC
SetBumpState(OBJECT_SELF,BUMPSTATE_UNBUMPABLE); //Keeps NPCs from being bumped to a standing postition
}