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


// ALFA 011 High Moor daytime spawns. Teric neDhalir 06/08/08




void main() 

{

int ifreq = d20(1) ;
int roll6 = d6(1);
int roll2 = d2(1);
int roll4 = d4(1);
int roll3 = d3(1);
int i = 1;


        if (ifreq <= 13)
        {
        switch (d3(1))
            {
            case 1:
            do 
			{ACR_SpawnObject("sjc_enc_deer", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= roll6);
            break;

            case 2:
			do
            {ACR_SpawnObject("sjc_enc_rabbit", OBJECT_TYPE_CREATURE);
				 i++;
			} while (i <= roll4);
            break;
			
			case 3:
			do
            {ACR_SpawnObject("sjc_enc_gamebird", OBJECT_TYPE_CREATURE);
				 i++;
			} while (i <= roll4);
            break;
            }
         }

        else if (ifreq <= 17)
        {
        switch (d8(1))
            {
            case 1:
            ACR_SpawnObject("sjc_enc_wpony", OBJECT_TYPE_CREATURE);
            break;

            case 2:
            ACR_SpawnObject("sjc_enc_whorse", OBJECT_TYPE_CREATURE);
            break;
			
			case 3:
            do 
			{ACR_SpawnObject("sjc_enc_wolf", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= roll2);
            break;
			
			case 4:
            ACR_SpawnObject("sjc_enc_ogre", OBJECT_TYPE_CREATURE);
            break;
			
			case 5:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("sjc_enc_bugbear" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= (roll3 + 1));
			break;
			
			case 6:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("sjc_enc_hobgoblin" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= (roll6 + 3));
			break;
            
			case 7:
            ACR_SpawnObject("sjc_enc_cyricpriest_3", OBJECT_TYPE_CREATURE);
			ACR_SpawnObject("sjc_enc_cyricsorcerer_1", OBJECT_TYPE_CREATURE);
			ACR_SpawnObject("sjc_enc_zhent_spearman", OBJECT_TYPE_CREATURE);
			ACR_SpawnObject("sjc_enc_zhent_bowman", OBJECT_TYPE_CREATURE);
			break;
			
			case 8:
            ACR_SpawnObject("sjc_enc_banecleric_3", OBJECT_TYPE_CREATURE);
			ACR_SpawnObject("sjc_enc_zhent_manatarms", OBJECT_TYPE_CREATURE);
			ACR_SpawnObject("sjc_enc_zhent_spearman", OBJECT_TYPE_CREATURE);
			ACR_SpawnObject("sjc_enc_zhent_bowman", OBJECT_TYPE_CREATURE);
			break;
			}
            }
        else if (ifreq <= 19)
        {
        	switch (d4(1))
			{
			case 1:
            ACR_SpawnObject("sjc_enc_boar", OBJECT_TYPE_CREATURE);
            break;
			
			case 2:
            do 
			{ACR_SpawnObject("sjc_enc_worg", OBJECT_TYPE_CREATURE);
    			 i++;
			} while (i <= roll2);
            break;
			
			case 3:
            ACR_SpawnObject("sjc_enc_ankheg", OBJECT_TYPE_CREATURE);
            break;		
		
			case 4:
			do
			{string sIncrement = IntToString(i);
			ACR_SpawnObject("sjc_enc_skeleton" + sIncrement, OBJECT_TYPE_CREATURE);
				 i++;}
			while (i <= roll4);
			break;
			}            

        }
        else
        {
        ACR_SpawnObject("sjc_plc_spawnplaceholder", OBJECT_TYPE_PLACEABLE);
        }
        }