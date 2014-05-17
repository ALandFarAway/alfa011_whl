#include "acr_spawn_i"

void main() {

object oSpawnPoint = GetNearestObjectByTag("ACR_SPAWN_WP");

ACR_SetIsSpawnPointEnabled(oSpawnPoint, FALSE, TRUE);

SendMessageToPC(GetEnteringObject(), "Deactivating p-chest spawn");

}