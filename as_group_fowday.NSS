////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Spawn System
//     Filename : as_group_example.nss
//      Version : 1.1
//         Date : 2007-4-24
//       Author : Ronan
//
//  Description
//  This is a simple example of a spawn group script which is used by the ACR's
//  spawn system. Though the name of the script is "as_group_example", the spawn
//  point which uses this script would simply have "example" listed as a spawn
//  group name, since the "as_group_" is always added on to the beginning. For a
//  more complex example of spawn groups, see the script "as_group_complex".
//
//  Revision History
//  1.0 2006-09-17: Ronan - Inception
//  1.1 2007-04-24: AcadiusLost: altered to use ABR resource names.
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


// ALFA 011 Forest of Wyrms daytime spawns. arianna0 2/2024




void main() 

{

int ifreq = d20(1);
int roll6 = d6(1);
int roll2 = d2(1);
int roll4 = d4(1);
int roll3 = d3(1);
int i = 1;


        if (ifreq <= 13)
        {
        switch (d2(1))
            {
            case 1:
			do
            {ACR_SpawnObject("abr_cr_a_m_deerred", OBJECT_TYPE_CREATURE);
				 i++;
			} while (i <= roll6);
            break;
			
			case 2:
			do
            {ACR_SpawnObject("abr_cr_an_w_gamebird", OBJECT_TYPE_CREATURE);
				 i++;
			} while (i <= roll4);
            break;
            }
         }

        else if (ifreq <= 17)
        {
        switch (d3(1))
            {
			case 1:
            ACR_SpawnObject("abr_cr_dr_wyvern", OBJECT_TYPE_CREATURE);
            break;
			
			case 2:
            ACR_SpawnObject("abr_cr_an_w_snake_sv", OBJECT_TYPE_CREATURE);
            break;
			
			case 3:
            ACR_SpawnObject("abr_cr_an_boar0h", OBJECT_TYPE_CREATURE);
            break;
			
	        }
        }
        else if (ifreq <= 19)
        {
        	switch (d2(1))
			{
			
			case 1:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("abr_cr_hu_lizman_" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= roll3);
			break;
			
			case 2:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("abr_cr_un_skeleton" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= roll4);
			break;
			}            

        }
        else
        {
		switch (d2(1))
        {
		case 1:
		ACR_SpawnObject("sjc_ytpureblood", OBJECT_TYPE_CREATURE);
		break;
		
		case 2:
		ACR_SpawnObject("abr_cr_dragon_grn_juv", OBJECT_TYPE_CREATURE);
		break;
        }
        }
}