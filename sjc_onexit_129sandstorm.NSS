void main()
{
object oExiting = GetExitingObject();

effect eEffect = GetFirstEffect(oExiting);
while (GetIsEffectValid(eEffect))
	{if (GetEffectCreator(eEffect) == OBJECT_SELF)
		{RemoveEffect(oExiting, eEffect);}
	eEffect = GetNextEffect(oExiting);
	
	}


}