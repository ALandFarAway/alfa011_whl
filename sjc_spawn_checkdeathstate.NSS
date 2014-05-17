// sjc_spawn_checkdeathstate
// Teric 070809
// Check to see if a persistant spawn point's child has been killed
//
#include "acr_db_persist_i"
#include "acr_spawn_i"
void main()
{

//object oArea = GetArea(OBJECT_SELF);
//int nIsStatusCached = GetLocalInt(oArea, "IsCached");
object oMod = GetModule();
string sDeadSpawn = GetLocalString(OBJECT_SELF, "SJC_CONTROLLING_TAG");


if (ACR_GetPersistentInt(oMod, sDeadSpawn + "isdead") == 1)
	{
	//SendMessageToAllDMs("Disabling Spawn Point"); // Debug
	ACR_SetIsSpawnPointEnabled(OBJECT_SELF, 0, 1);
	}

}