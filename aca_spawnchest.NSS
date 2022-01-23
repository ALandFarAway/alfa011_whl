#include "acr_spawn_i"

void main() {

object oSpawnPoint = GetNearestObjectByTag("ACR_SPAWN_WP");

ACR_SetIsSpawnPointEnabled(oSpawnPoint, TRUE, TRUE);

SendMessageToPC(GetEnteringObject(), "Activating p-chest spawn");

}