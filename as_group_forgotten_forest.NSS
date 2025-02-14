#include "acr_spawn_i"

void main();
// Created by Riotnrrd for ALFA 4/2012
// Temperate Hills Random Encounters
// Encounter Level 2 - 9

/* 


*/

void main() {

	int nRoll = d100();
	int i;

	if (GetIsDay()) 
	{ 
		if (nRoll <= 6) ACR_SpawnGroup("abr_c_p_treant_oak1");
		else if (nRoll <= 14) ACR_SpawnObject("abr_c_p_treant_oak1", OBJECT_TYPE_CREATURE);
		else if (nRoll <= 20) ACR_SpawnObject("abr_cr_fy_f_pixie", OBJECT_TYPE_CREATURE);
		else if (nRoll <= 28) ACR_SpawnObject("abr_cr_an_direbadger", OBJECT_TYPE_CREATURE);
		else if (nRoll <= 38) ACR_SpawnObject("abr_cr_fy_pixie", OBJECT_TYPE_CREATURE);
		else if (nRoll <= 44) ACR_SpawnObject("abr_cr_fy_jermlaine", OBJECT_TYPE_CREATURE);
		else if (nRoll <= 50) ACR_SpawnGroup("sprites");
		else if (nRoll <= 60) ACR_SpawnGroup("herbs4");
		else if (nRoll <= 62) ACR_SpawnGroup("alfa_huntable_forest");
		else if (nRoll <= 66) ACR_SpawnGroup("alfa_animal_deer");
		else if (nRoll <= 72) ACR_SpawnGroup("alfa_animal_boar");
		else if (nRoll <= 78) ACR_SpawnGroup("alfa_animal_rabbit");
		else if (nRoll <= 82) ACR_SpawnGroup("alfa_alfa_black_bears");
		else if (nRoll <= 96) ACR_SpawnGroup("alfa_wolf_pack");
		else ACR_SpawnObject("abr_cr_fy_dryad4", OBJECT_TYPE_CREATURE);
	}	
	else	// Is night
	{
		if (nRoll <= 2) ACR_SpawnGroup("alfa_black_bears");
		else if (nRoll <= 4) ACR_SpawnObject("abr_cr_an_direbadger", OBJECT_TYPE_CREATURE);
		else if (nRoll <= 18) ACR_SpawnGroup("alfa_barghest_pack");
		else if (nRoll <= 14) ACR_SpawnObject("abr_c_p_treant_oak1", OBJECT_TYPE_CREATURE);
		else if (nRoll <= 25) ACR_SpawnObject("abr_cr_ou_shadowmastiff", OBJECT_TYPE_CREATURE);
		else if (nRoll <= 45) ACR_SpawnGroup("alfa_herbs2");
		else if (nRoll <= 65) ACR_SpawnGroup("alfa_dire_badgers");
		else if (nRoll <= 82) ACR_SpawnGroup("alfa_ghoul_gang");
		else if (nRoll <= 96) ACR_SpawnGroup("alfa_sprites");
	
		else ACR_SpawnObject("abr_cr_dr_wyvern", OBJECT_TYPE_CREATURE);
	}
}