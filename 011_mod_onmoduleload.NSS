////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ALFA Configuration File
//     Filename : acf_mod_onmoduleload.nss
//    $Revision:: 197        $ current version of the file
//        $Date:: 2006-12-23#$ date the file was created or modified
//       Author : Ronan
//
//  Local Variable Prefix = None
//
//  Description
//  This script calls the module's OnLoad event, and any custom code added by
//  this server. It is usually used to set up server-specific options, such as
//  the population system (see below).
//  This file should NOT be overwriten in ACR updates so as to preserve any of
//  the server's customized code they may have added.
//
//  Revision History
//   2010/12/24  AcadiusLost - interim ModuleLoad code hack for server population and IP Address
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#include "acr_mod_events_i"
#include "acr_db_persist_i"
#include "011_door_i"
#include "acr_quest_i"

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

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

void InitializeSpawnResets()
{
	object area,o;
	string str;
	int lock, open;

	for (area = GetFirstArea(); GetIsObjectValid(area); area = GetNextArea()) {
		for (o = GetFirstObjectInArea(area); GetIsObjectValid(o); o = GetNextObjectInArea(area)) {

			
			/* ignore non-whatever this is */
			if (GetObjectType(o) != OBJECT_TYPE_WAYPOINT)
				continue;

			if (GetLocalInt(o, "ACR_SPAWN_TYPE") != 0)
				SetLocalInt(o, "ACR_SPAWN_RESPAWN_COUNT", -1);
		}

	}
}

void main() {

  ACR_ModuleOnModuleLoad();

    SetGlobalInt(_ACR_SETTINGS_SERVER_ID, 11);
	//SetGlobalInt(_ACR_SETTINGS_SERVER_REGION, 3559);
	SetGlobalString(_ACR_SETTINGS_SERVER_NAME, "ALFA 011 Western Heartlands");
	SetGlobalString(_ACR_SETTINGS_SERVER_IP, "64.27.48.137:5121");

    // Custom code goes below this line.

	DelayCommand(6.0, InitializeDoors());
	DelayCommand(12.0, InitializeSpawnResets());

	SetLocalInt(GetModule(), "ACR_HEALTHMONITOR_GAMEOBJUPDATE_BACKOFF", 1);
	
	ExecuteScript("nwnx_craft_init", GetModule());

	CreateObject(OBJECT_TYPE_PLACEABLE, "x0_mod_treasure_low_admin", GetLocation(GetWaypointByTag("WP_ADMIN_LOOT_LOW")));
	CreateObject(OBJECT_TYPE_PLACEABLE, "x0_mod_treasure_med_admin", GetLocation(GetWaypointByTag("WP_ADMIN_LOOT_MED")));
	CreateObject(OBJECT_TYPE_PLACEABLE, "x0_mod_treasure_high_admin", GetLocation(GetWaypointByTag("WP_ADMIN_LOOT_HIGH")));
	CreateObject(OBJECT_TYPE_PLACEABLE, "x0_mod_treasure_uniq_admin", GetLocation(GetWaypointByTag("WP_ADMIN_LOOT_UNIQ")));
	

}