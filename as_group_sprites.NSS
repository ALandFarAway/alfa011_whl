#include "acr_spawn_i"

void main();

// Created by Arianna for ALFA 12-2024
void main() {
	int nSpriteF = d4() + 4;
	int nSpriteM = d2();
	int nBrownie = d4();
	int nKorred  = d4();
	int i;
	
	for (i = 0; i < nSpriteF; i++) ACR_SpawnObject("abr_cr_fy_f_pixie", OBJECT_TYPE_CREATURE);
	for (i = 0; i < nSpriteM; i++) ACR_SpawnObject("abr_cr_fy_pixie", OBJECT_TYPE_CREATURE);
	for (i = 0; i < nBrownie; i++) ACR_SpawnObject("abr_cr_hu_brownie", OBJECT_TYPE_CREATURE);
	for (i = 0; i < nKorred; i++) ACR_SpawnObject("abr_cr_fy_korred1", OBJECT_TYPE_CREATURE);
	ACR_SpawnObject("abr_cr_fy_dryad4", OBJECT_TYPE_CREATURE);
}