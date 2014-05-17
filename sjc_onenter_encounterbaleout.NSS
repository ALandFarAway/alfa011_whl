void main()
{

object oEntering = GetEnteringObject();

if (GetLocalInt(oEntering, "SJC_BROKEN") == 1)
	{
	DestroyObject(oEntering, 0.0f);	
	}

}