// as_group_checkdeathstate
// Teric 231109
// Check to see if a persistant spawn point's child has been killed
// 
#include "acr_db_persist_i"
#include "acr_spawn_i"
void main()
{
string sDeadSpawn = GetLocalString(OBJECT_SELF, "SJC_CONTROLLING_TAG");
object oArea = GetArea(OBJECT_SELF);
int nIsStatusCached = GetLocalInt(oArea, sDeadSpawn + "IsCached");
object oMod = GetModule();


if (!nIsStatusCached) 
	{
    SendMessageToPC(GetFirstPC(), "not Cached"); // Debug 
	int nPstate = ACR_GetPersistentInt(oMod, sDeadSpawn + "isdead");
    SetLocalInt(oArea, "SpawnPointShouldBeDisabled", nPstate);
    SetLocalInt(oArea, sDeadSpawn + "IsCached", TRUE);
	}

if (GetLocalInt(oArea, "SpawnPointShouldBeDisabled")) 
	{
	SendMessageToPC(GetFirstPC(), "Controlling Mob is Dead"); // Debug
	return;
	}	

// Spawn code here	
}