////////////////////////////////////////////////////////////////////////////////
//
//  System Name : Morale-enabled OnPerception file
//     Filename : sjc_onperception_morale
//    $Revision:: 1.1        $ current version of the file
//        $Date:: 2007-03-20#$ date the file was created or modified
//       Author : Teric 
//
//    Var Prefix:
//  Dependencies:
//
//  Description
//  This script calls the ACR's OnPerception event handler for creatures
//  and any custom code a server may need. It is not updated in ACR updates.
//
//  Revision History
//  inception: Teric
//  1.1  8/26/07 AcadiusLost: added test for GetIsPC(), and return when DIVIDE BY ZERO
//	1.2  9/8/08 Teric. Fixed error leading to all creatures havinf iRating = 0, and fixed to work with commoner faction.
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#include "acr_creature_i"
#include "x0_i0_assoc"
#include "x0_i0_enemy"

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

void main()
{
    ACR_CreatureOnPerception();

	// check if it's a PC being perceived, if not, return without further action.
	if 	(!GetIsPC(GetLastPerceived())) {
	    return;
		}
	
    	// Morale check code Teric neDhalir 0707
		
		
		// Morale check dice roll 2D10
		int iRoll = d10(2);
		// Morale rating (set on creature as variable int SJC_MORALERATING.
		// A variable of 0 means the creature will always avoid PCs
		int iRating = GetLocalInt(OBJECT_SELF,"SJC_MORALERATING");
		
		if  (iRating == 0)
			{ClearAllActions(TRUE);
			ActionMoveAwayFromObject(GetLastPerceived(),TRUE,60.0f);}
		
		else
		{// Check for amount of damage sustained and set die modifier accordingly
		int iDamageModifier;
		int iDamage = GetPercentageHPLoss(OBJECT_SELF);
			if 
			(iDamage <= 50)
			{iDamageModifier = -4;}
			else if
			(iDamage <= 75)
			{iDamageModifier = -2;}
			else
			{iDamageModifier = 0;}
		// Check for alignment and set die modifier accordingly
		int iAlignmentModifier;
		int iAlignment = GetLawChaosValue(OBJECT_SELF);
			if 
			(iAlignment <= 33)
			{iAlignmentModifier = -1;}
			else if
			(iAlignment >= 66)
			{iAlignmentModifier = 1;}
			else
			{iAlignmentModifier = 0;}
		// Check for ratio of enemies to allies
		int iOutnumberModifier;
		struct sSituation sitCurr = CountEnemiesAndAllies(50.0,OBJECT_SELF);
		int nNumEnemies = sitCurr.ENEMY_NUM;
		int nNumAllies = sitCurr.ALLY_NUM;
		
		// AcadiusLost - escape the DIVIDE BY ZERO case.
		    if (nNumEnemies == 0) { return;}
			
			if
			(nNumEnemies / (nNumAllies + 1) == 1)
			{iOutnumberModifier = 0;}
			else if
			((nNumAllies + 1) > nNumEnemies)
			{iOutnumberModifier = (nNumAllies + 1) / nNumEnemies;}
			else
			{iOutnumberModifier = -(nNumEnemies / (nNumAllies + 1));}
		// Check for CR of testing creature
		int iCRModifier;
			if
			(GetChallengeRating(OBJECT_SELF) > 7.5)
			{iCRModifier = 3;}
			else if
			(GetChallengeRating(OBJECT_SELF) > 4.5)
			{iCRModifier = 2;}
			else if
			(GetChallengeRating(OBJECT_SELF) > 2.0)
			{iCRModifier = 1;}
			else if
			((GetChallengeRating(OBJECT_SELF) < 0.5) & (GetChallengeRating(OBJECT_SELF) > 0.25))
			{iCRModifier = -1;}
			else if
			(GetChallengeRating(OBJECT_SELF) < 0.25)
			{iCRModifier = -2;}
			else 
			{iCRModifier = 0;}
		// Work out die roll needed to pass morale test
		int iFinalScore;
		object oTarget = GetNearestSeenEnemy(OBJECT_SELF,1);
		iFinalScore = iRating + iDamageModifier + iAlignmentModifier + iOutnumberModifier + iCRModifier;
			
		if (iRoll > iFinalScore)
			{ClearAllActions(TRUE);
			ActionMoveAwayFromObject(oTarget,TRUE,80.0f);}
		// Debugging message
		//string sRoll = IntToString(iRoll);
		//string sRating = IntToString(iRating);
		//string sDamage = IntToString(iDamageModifier);
		//string sAlignment = IntToString(iAlignmentModifier);
		//string sOutnumber = IntToString(iOutnumberModifier);
		//string sCR = IntToString(iCRModifier);
		//string sFinalScore = IntToString(iFinalScore);
		//SendMessageToPC( GetFirstPC(), (sRoll + " " + sRating + " " +  sDamage + " " +  sAlignment + " " +  sOutnumber + " " +  sCR + " " +  sFinalScore) );
		// 		End morale test
		}
		
			
			
		
		
		
	
	
	
	
	
	
	
}