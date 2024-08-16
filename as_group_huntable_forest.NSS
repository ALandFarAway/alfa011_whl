////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Spawn System
//     Filename : as_group_complex.nss
//      Version : 1.3
//         Date : 2007-4-24
//       Author : Ronan
//
//  Description
//  This is a complex example of a spawn group script which is used by the ACR's
//  spawn system. Though the name of the script is "as_group_complex", the spawn
//  point which uses this script would simply have "complex" listed as a spawn
//  group name, since the "as_group_" is always added on to the beginning. This
//  example is intended for people familiar with programming. For a simpler
//  example, see the script as_group_example.
//
//  Revision History
//  1.0 2006-09-17: Ronan - Inception
//  1.1 2007-04-24: AcadiusLost: altered to use ABR resource names.
//  1.2 2007-04-26: AcadiusLost: switched placables to base-pallete resources
//  1.3 2007-04-27: AcadiusLost: fixed a typo in placables
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// This line is required on all spawn group scripts.
#include "acr_spawn_i"

////////////////////////////////////////////////////////////////////////////////
// Constants ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Structures //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Global Variables ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Prototypes /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// This is the main function, which is what the spawn system runs when this
// spawn group is spawned.
void main();

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// Created by Riotnrrd for ALFA 4/2012
void main() {
// Huntable Forest Animals EL ?? 
// Created by Castano for ALFA 4/2012
	int nRoll = d100();
	int i;

	if (nRoll <= 5) // Bears
	{
		int nBears = d2();
		for (i = 0; i < nBears; i++) ACR_SpawnObject("abr_cr_an_w_blackbear3h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 10) // Brown_Bears Grizzly
	{
		int nBrown_Bears = d2();
		for (i = 0; i < nBrown_Bears; i++) ACR_SpawnObject("abr_cr_an_w_bear_grizzly4h2", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 20) //Boar
	{
		int nBoars = d2();
		for (i = 0; i < nBoars; i++) ACR_SpawnObject("abr_cr_an_boar0h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 25) //Sow
	{
		int nBoars2 = d3();
		for (i = 0; i < nBoars2; i++) ACR_SpawnObject("abr_cr_an_sow0h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 35) //Stag
	{
		int nDeer = d2();
		for (i = 0; i < nDeer; i++) ACR_SpawnObject("abr_cr_a_m_deer0h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 40) //Doe
	{
		int nDeer2 = d2();
		for (i = 0; i < nDeer2; i++) ACR_SpawnObject("abr_cr_a_f_deer2h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 45) //Fawn
	{
		int nDeer3 = d2();
		for (i = 0; i < nDeer3; i++) ACR_SpawnObject("abr_cr_a_fa_deer3h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 65) //Rabbits
	{
		int nRabbits = d2();
		for (i = 0; i < nRabbits; i++) ACR_SpawnObject("abr_cr_an_w_rabbit1h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 85) //Weasel
	{
		int nSquirrels = d2();
		for (i = 0; i < nSquirrels; i++) ACR_SpawnObject("abr_cr_an_w_weasel0h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 85) //Wolves
	{
		int nWolves = d2();
		for (i = 0; i < nWolves; i++) ACR_SpawnObject("abr_cr_an_wild_wolf1h", OBJECT_TYPE_CREATURE);
	}
	else //Wolverines
	{
		int nWolverines = d2();
		for (i = 0; i < nWolverines; i++) ACR_SpawnObject("abr_cr_an_w_wolverine0h", OBJECT_TYPE_CREATURE);
	}
}