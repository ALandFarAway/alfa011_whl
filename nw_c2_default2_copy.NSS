//::///////////////////////////////////////////////
//:: Default On Perceive
//:: NW_C2_DEFAULT2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "hench_i0_ai"
#include "ginc_behavior"
#include "acr_creature_i"
#include "x0_i0_assoc"
#include "x0_i0_enemy"


int GetIsBroken(object oTesting, object oPerceived)
	{
	    // Morale check code Teric neDhalir 0707
		// Morale check dice roll 2D10
		int iRoll = d10(2);
		// Morale rating (set on creature as variable int SJC_MORALERATING.
		// A variable of 0 means the creature will always avoid PCs
		int iRating = GetLocalInt(oTesting,"SJC_MORALERATING");
		
		if  (iRating == 0)
			{return 1;}
		
		else
		{// Check for amount of damage sustained and set die modifier accordingly
		int iDamageModifier;
		int iDamage = GetPercentageHPLoss(oTesting);
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
		int iAlignment = GetLawChaosValue(oTesting);
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
		// Reduced range to creature perception distance
		struct sSituation sitCurr = CountEnemiesAndAllies(35.0f,oTesting);
		int nNumEnemies = sitCurr.ENEMY_NUM;
		int nNumAllies = sitCurr.ALLY_NUM;
		
		// AcadiusLost - escape the DIVIDE BY ZERO case.
		// Teric: Commented this out, because creatures that are never hostile dealt with
		// in the SJC_MORALERATING == 0 case above
		//    if (nNumEnemies == 0) { return;}
			
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
			(GetChallengeRating(oTesting) > 7.5)
			{iCRModifier = 3;}
			else if
			(GetChallengeRating(oTesting) > 4.5)
			{iCRModifier = 2;}
			else if
			(GetChallengeRating(oTesting) > 2.0)
			{iCRModifier = 1;}
			else if
			((GetChallengeRating(oTesting) < 0.5) & (GetChallengeRating(OBJECT_SELF) > 0.25))
			{iCRModifier = -1;}
			else if
			(GetChallengeRating(oTesting) < 0.25)
			{iCRModifier = -2;}
			else 
			{iCRModifier = 0;}
		// Give bonus if perceived creature is injured Teric 031209
			int iWoundedModifier;
			if (GetPercentageHPLoss(oPerceived) < 25)
			{iWoundedModifier = 3;}
			else if (GetPercentageHPLoss(oPerceived) < 100)
			{iWoundedModifier = 1;}
			else
			{iWoundedModifier = 0;}
		// Work out die roll needed to pass morale test
		int iFinalScore;
		//object oTarget = GetNearestSeenEnemy(OBJECT_SELF,1);
		iFinalScore = iRating + iDamageModifier + iAlignmentModifier + iOutnumberModifier + iCRModifier + iWoundedModifier;
			
		if (iRoll > iFinalScore)
			{return 1;}
		else
			{return 0;}
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


void main()
{
			// * if not running normal or better Ai then exit for performance reasons
    		// * if not running normal or better Ai then exit for performance reasons
    		if (GetAILevel() == AI_LEVEL_VERY_LOW) return;

        	// script hidden object shouldn't react (for cases where AI not turned off)
    		if (GetScriptHidden(OBJECT_SELF)) return;

    int iFocused = GetIsFocused();

    object oLastPerceived = GetLastPerceived();
    int bSeen = GetLastPerceptionSeen();
    		if (iFocused <= FOCUSED_STANDARD)
   			 {
        		//This is the equivalent of a force conversation bubble, should only be used if you want an NPC
        		//to say something while he is already engaged in combat.
        		if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION) && GetIsPC(oLastPerceived) &&
           		 bSeen)
       		 {
           		 SpeakOneLinerConversation();
       		 }

        //If the last perception event was hearing based or if someone vanished then go to search mode
        if (GetLastPerceptionVanished() || GetLastPerceptionInaudible())
        {
//          Jug_Debug(GetName(OBJECT_SELF) + " lost perceived " + GetName(oLastPerceived) + " seen " + IntToString(GetObjectSeen(oLastPerceived)) + " heard " + IntToString(GetObjectHeard(oLastPerceived)));
            if (!GetObjectSeen(oLastPerceived) && !GetObjectHeard(oLastPerceived) &&
                !GetIsDead(oLastPerceived, TRUE) && GetArea(oLastPerceived) == GetArea(OBJECT_SELF) &&
                GetIsEnemy(oLastPerceived) && (!HENCH_MONSTER_DONT_CHECK_HEARD_MONSTER || GetIsPCGroup(oLastPerceived)))
            {
//              Jug_Debug(GetName(OBJECT_SELF) + " move to last heard or seen");
                if (GetLastPerceptionVanished() || !GetLocalInt(OBJECT_SELF, sHenchScoutMode))
                {
//                  Jug_Debug(GetName(OBJECT_SELF) + " setting enemy location");
                    SetEnemyLocation(oLastPerceived);
                }
                // add check if target - prevents creature from following the target
                // due to ActionAttack without actually perceiving them
                if (GetLocalObject(OBJECT_SELF, sHenchLastTarget) == oLastPerceived)
                {
//                  Jug_Debug(GetName(OBJECT_SELF) + " calling det combat round, doing clearallactions");
                    ClearAllActions();
                    DeleteLocalObject(OBJECT_SELF, sHenchLastTarget);
                    HenchDetermineCombatRound(oLastPerceived, TRUE);
                }
            }
        }
        //Do not bother checking the last target seen if already fighting
        else if (bSeen && !GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
        {
//          Jug_Debug(GetName(OBJECT_SELF) + " checking perceived " + GetName(oLastPerceived) + " " + IntToString(GetObjectSeen(oLastPerceived)));
            // note : hearing is disabled and is only done in heartbeat. Calling GetIsEnemy with hearing causes
            // a noticeable lag to machine
            if (GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
            {
                HenchDetermineSpecialBehavior();
            }
            else if (GetIsEnemy(oLastPerceived) && !GetIsDead(oLastPerceived, TRUE))
            {
                if(!GetHasEffect(EFFECT_TYPE_SLEEP))
                {
//                  Jug_Debug(GetName(OBJECT_SELF) + " starting combat round in percep");
                    SetFacingPoint(GetPosition(oLastPerceived));
                    HenchDetermineCombatRound(oLastPerceived);
                }
            }
            //Linked up to the special conversation check to initiate a special one-off conversation
            //to get the PCs attention
            else if (bSeen && GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION) && GetIsPC(oLastPerceived))
            {
                ActionStartConversation(OBJECT_SELF);
            }
            // activate ambient animations or walk waypoints if appropriate
            if (!IsInConversation(OBJECT_SELF))
            {
                if (GetIsPC(oLastPerceived) &&
                   (GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS)
                    || GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS_AVIAN)
                    || GetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS)
                    || GetIsEncounterCreature()))
                {
                    SetAnimationCondition(NW_ANIM_FLAG_IS_ACTIVE);
                }
            }
        }
        else if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL) && bSeen)
        {
            HenchDetermineSpecialBehavior();
        }
    }
    if(GetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT) && bSeen)
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_PERCEIVE));
    }
}