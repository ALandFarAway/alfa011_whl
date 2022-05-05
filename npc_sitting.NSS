// goes in the onspawn of NPC



void main()
{
//Sits the NPC down
int nChair = 1;
object oChair;
//"NPC_CHAIR" is the tag name of the chair to be used
oChair = GetNearestObjectByTag("NPC_CHAIR", OBJECT_SELF, nChair);
//ActionSit(oChair);
ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR, 1.0, 1800.0);//trying
}