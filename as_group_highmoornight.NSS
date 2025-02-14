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


// 011 High Moor nighttime spawns. Teric neDhalir 070808




void main() 

{

int ifreq = d20(1) ;
int roll6 = d6(1);
int roll2 = d2(1);
int roll4 = d4(1);
int roll10 = d10(1);
int roll3 = d3(1);
int i = 1;


        if (ifreq <= 13)
        {
        switch (d2(1))
            {
            case 1:
            do 
			{ACR_SpawnObject("abr_cr_an_direrat", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= roll10);
            break;

            case 2:
            do 
			{ACR_SpawnObject("abr_cr_an_w_bat", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= roll10);
            break;
			
            }
         }

        else if (ifreq <= 17)
        {
        switch (d10(1))
            {
			case 1:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("abr_cr_hu_orcfighter" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= (roll6 + 3));
			break;

            case 2:
            do 
			{ACR_SpawnObject("abr_cr_an_w_wolf", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= roll2);
            break;
			
			case 3:
            ACR_SpawnObject("abr_cr_an_w_badger1", OBJECT_TYPE_CREATURE);
            break;
			
			case 4:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("abr_cr_hu_goblin" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= (roll6 + 3));
			break;
			
			case 5:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("abr_cr_hu_bugbear" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= (roll3 + 1));
			break;
			
			case 6:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("abr_cr_hu_hobgoblin" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= (roll6 + 3));
			break;
			
			case 7:
            ACR_SpawnObject("abr_cr_gt_ogre", OBJECT_TYPE_CREATURE);
            break;
			
			case 8:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("abr_cr_hu_koboldfighter" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= (roll6 + 3));
			break;
			
			case 9:
            ACR_SpawnObject("abr_c_ab_willowisp6", OBJECT_TYPE_CREATURE);
            break;
			
			case 10:
            ACR_SpawnObject("abr_cr_gt_troll", OBJECT_TYPE_CREATURE);
            break;
            }
            }
        else if (ifreq <= 19)
        {
        	switch (d6(1))
			{
			case 1:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("abr_cr_un_skeleton_patrol" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= roll4);
			break;
			
			case 2:
            do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("abr_cr_un_zombie" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= roll2);
            break;
			
			case 3:
            ACR_SpawnObject("010_cr_magbeast_ankheg3", OBJECT_TYPE_CREATURE);
            break;
			
			case 4:
            do 
			{ACR_SpawnObject("abr_cr_mb_worg", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= roll2);
            break;
			
			case 5:
            ACR_SpawnObject("abr_cr_an_direbadger", OBJECT_TYPE_CREATURE);
            break;
			
			case 6:
            ACR_SpawnObject("abr_cr_un_wight", OBJECT_TYPE_CREATURE);
            break;
			}
            

        }
        else
        {
        ACR_SpawnObject("abr_pl_co_corpse_", OBJECT_TYPE_PLACEABLE);
        }
        }