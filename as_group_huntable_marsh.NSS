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
	else if (nRoll <= 10) // Alligators
	{
		int nAlligators = d2();
		for (i = 0; i < nAlligators; i++) ACR_SpawnObject("abr_cr_an_w_gatorbig3h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 20) //Rabbits
	{
		int nRabbits = d2();
		for (i = 0; i < nRabbits; i++) ACR_SpawnObject("abr_cr_an_w_marshrabbit_h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 25) //Turtles
	{
		int nTurtles = d3();
		for (i = 0; i < nTurtles; i++) ACR_SpawnObject("abr_cr_an_w_turtle,snaph", OBJECT_TYPE_CREATURE);
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
	else if (nRoll <= 65) //Snakes
	{
		int nSnakes = d2();
		for (i = 0; i < nSnakes; i++) ACR_SpawnObject("cr_a_rep_reed_snake3h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 85) //Weasel
	{
		int nWeasels = d2();
		for (i = 0; i < nWeasels; i++) ACR_SpawnObject("abr_cr_an_w_weasel0h", OBJECT_TYPE_CREATURE);
	}
	else if (nRoll <= 85) //Game Birds
	{
		int nGame_Birds = d2();
		for (i = 0; i < nGame_Birds; i++) ACR_SpawnObject("abr_cr_an_w_gamebird", OBJECT_TYPE_CREATURE);
	}
	else //Frogs
	{
		int nFrogs = d2();
		for (i = 0; i < nFrogs; i++) ACR_SpawnObject("abr_cr_an_frogh", OBJECT_TYPE_CREATURE);
	}
}