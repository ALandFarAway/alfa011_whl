//
//  aca_retanasnow_wand.nss
//
//  To turn snow on (by creating placeables) in an area.
//  meant to be called by a DM use item (like a wand).
//

//  function to check and add snow to an area
void SpawnSnow(object oArea);

// function to control snow for a module
//   TRUE = Start snow
//   FALSE = Stop snow
void ModuleSnowToggle(int bChoice = TRUE);

// function to turn snow off for an area
void DeSpawnSnow(object oArea);


void main () {

    object oArea = GetArea(GetItemActivator());

    if (GetLocalInt(oArea, "SNOWING") == FALSE) {
	    SendMessageToAllDMs("Snow being activated");
        //start the snow for the current area first
        SpawnSnow(oArea);
        // then, move on to other exterior areas.
        ModuleSnowToggle(TRUE);
	} else {
	    SendMessageToAllDMs("Snow being deactivated.");
		// turn off snow for the current area first
		DeSpawnSnow(oArea);
		// then, move on to other areas.
		ModuleSnowToggle(FALSE);
	}

}


void SpawnSnow(object oArea) {
    // no need to spawn new placeables if it's already set.
    if (GetLocalInt(oArea, "SNOWING") == TRUE) { return; }
	
	int nAreaX = GetAreaSize(AREA_WIDTH, oArea);
	float fXMax = (IntToFloat(nAreaX) * 15.0 - 20.0 );
	int nAreaY = GetAreaSize(AREA_HEIGHT, oArea);
	float fYMax = (IntToFloat(nAreaY) * 15.0 - 20.0 );
	
	float fX = 20.0;
	float fY = 20.0;
	
	object oFirstSnow = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "fx_snowfall", Location(oArea, Vector(fX, fY, 0.0), 0.0));
	SetLocalObject(oArea, "FIRST_SNOW", oFirstSnow);
	
	object oTestBadger = CreateObject(OBJECT_TYPE_CREATURE, "c_badger", Location(oArea, Vector((fXMax/2.0), (fYMax/2.0), 0.0), 0.0));
	float fZ = GetPositionFromLocation(GetLocation(oTestBadger)).z;
	SendMessageToAllDMs("using "+FloatToString(fZ)+" as the snow height for area "+GetName(oArea));
	DestroyObject(oTestBadger);
	
	object oLastSnow = oFirstSnow;
	
	// now that the first pointer is set, move on to the rest of them.
	while (fY <= fYMax) {
	    while (fX <= fXMax) {
	        fX = fX + 20.0;
	        object oNewSnow = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "fx_snowfall", Location(oArea, Vector(fX, fY, fZ), 0.0));
	  	    // set the pointer on the previous effect to the new one
		    SetLocalObject(oLastSnow, "NEXT_SNOW", oNewSnow);
		    // save the reference to add next time.
		    oLastSnow = oNewSnow;
		} // one row done, move on to the next
		
		// increment Y to next row
	    fY = fY + 20.0;
		// start at west side again
		fX = 20.0;
	}
	// mark the last placed effect as the end for that area.
	SetLocalObject(oLastSnow, "NEXT_SNOW", OBJECT_INVALID);
	SetLocalInt(oArea, "SNOWING", TRUE);
	
}



void DeSpawnSnow(object oArea) {
    // no need to destroy placeables if it's not snowing.
    if (GetLocalInt(oArea, "SNOWING") == FALSE) { return; }
	
	object oCurrentTarget = GetLocalObject(oArea, "FIRST_SNOW");
	
	object oNextTarget = OBJECT_INVALID;	
	
	while (oCurrentTarget != OBJECT_INVALID) {
	    oNextTarget = GetLocalObject(oCurrentTarget, "NEXT_SNOW");
		DestroyObject(oCurrentTarget);
		oCurrentTarget = oNextTarget;
	}
	SendMessageToAllDMs("Snow removed for area "+GetName(oArea));
	SetLocalInt(oArea, "SNOWING", FALSE);
	SetLocalObject(oArea, "FIRST_SNOW", OBJECT_INVALID);
    
}



void ModuleSnowToggle(int bChoice) {

    object oCurrentArea = GetFirstArea();
	float fDelay = 5.0;

    if (bChoice == TRUE) {
	    // turning snow on
		while (oCurrentArea != OBJECT_INVALID) {
	        if (!GetIsAreaInterior(oCurrentArea) && GetIsAreaAboveGround(oCurrentArea)) {
			    // exterior and aboveground, good to start snow
				DelayCommand(fDelay, SpawnSnow(oCurrentArea));
				fDelay = fDelay + 5.0;
			}
			oCurrentArea = GetNextArea();
		}
	} else {
	    // turning snow off
		while (oCurrentArea != OBJECT_INVALID) {
		    if (!GetIsAreaInterior(oCurrentArea) && GetIsAreaAboveGround(oCurrentArea)) {
			    // exterior and aboveground, good to stop snow
				DelayCommand(fDelay, DeSpawnSnow(oCurrentArea));
				fDelay = fDelay + 5.0;
			}
			oCurrentArea = GetNextArea();
		}
	}

}