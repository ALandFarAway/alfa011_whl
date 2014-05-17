
#include "acr_db_persist_i"

void SpawnSpiders()
{
if (GetLocalInt(OBJECT_SELF, "PCCount") == 0) 
	{
	return;
	}
int iCounter = 1;
int iRoll3 = d3();
int iDelay = (d2() * 60);
float fDelay = IntToFloat(iDelay);



while (iCounter <= iRoll3)
	{
		switch (d2(1))

		{
		case 1:
		CreateObject(OBJECT_TYPE_CREATURE, "sjc_enc_smallspider", GetLocation(GetObjectByTag("u0104_spider_" + (IntToString(d3())))));
		iCounter = iCounter + 1;
		break;
		
		case 2:
		CreateObject(OBJECT_TYPE_CREATURE, "sjc_enc_spiderswarm", GetLocation(GetObjectByTag("u0104_spider_" + (IntToString(d3())))));
		iCounter = iCounter + 1;
		break;
		}

	}

DelayCommand(fDelay, SpawnSpiders());
}

void main()
{
if (ACR_GetPersistentInt(GetModule(), "sjc_enc_u0104_spiderqueenisdead") == 1)
	{
	return;
	}

int iCount = GetLocalInt(OBJECT_SELF, "PCCount");
object oEnterer = GetEnteringObject();

if (!GetIsPC(oEnterer) && !GetIsDM(oEnterer) && !GetIsDMPossessed(oEnterer))
	{
	return;
	}

if (GetIsPC(oEnterer) || GetIsDMPossessed(oEnterer))
	{
	SetLocalInt(OBJECT_SELF, "PCCount", (iCount + 1));
	}

SpawnSpiders();





}