//ga_destroy_self - for use on placeables


//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

object oTarget;
oTarget = OBJECT_SELF;

DestroyObject(oTarget, 0.0);

}
