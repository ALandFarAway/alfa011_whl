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


// 011 Undermoor spawns. Teric neDhalir 070808




void main() 

{
if (d100() <= 20)
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
			{ACR_SpawnObject("sjc_enc_rat_um", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= roll10);
            break;

            case 2:
            do 
			{ACR_SpawnObject("sjc_enc_bat_um", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= roll10);
            break;
			
            }
         }

        else if (ifreq <= 17)
        {
        switch (d6(1))
            {
			case 1:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("sjc_enc_orc_um" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= (roll6 + 3));
			break;

			
			case 2:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("sjc_enc_goblin_um" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= (roll6 + 3));
			break;
			
				
			case 3:
            ACR_SpawnObject("sjc_enc_troll_um", OBJECT_TYPE_CREATURE);
            break;
			
			case 4:
            ACR_SpawnObject("sjc_enc_wight_um", OBJECT_TYPE_CREATURE);
            break;
			
			case 5:
            ACR_SpawnObject("sjc_enc_giantspider_um", OBJECT_TYPE_CREATURE);
            break;
			
			case 6:
            do 
			{ACR_SpawnObject("sjc_enc_ghoul_um", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= (roll3 + 1));
            break;
            }
            }
        else if (ifreq <= 19)
        {
        ACR_SpawnObject("sjc_enc_ankheg_um", OBJECT_TYPE_CREATURE);
        }
        else
        {
        switch (d2(1))
			{
			case 1:
			ACR_SpawnObject("sjc_enc_drowcleric_um", OBJECT_TYPE_CREATURE);
			do 
			{ACR_SpawnObject("sjc_enc_drowfighter_um", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= (roll3 + 2));
			break;
			
			case 2:
			ACR_SpawnObject("sjc_enc_derrosorceror", OBJECT_TYPE_CREATURE);
			do 
			{ACR_SpawnObject("sjc_enc_derrofighter", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= (roll3 + 2));
			break;
			}
        	}
}
}