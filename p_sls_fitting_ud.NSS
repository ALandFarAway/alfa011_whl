// SLS: Scripted Lighting System
// "on user defined" for light fittings
// Brendan Ellis (slayweb.com): 2006-11-14

// EVENTS
// 3001 - Initialise
// 3002 - Update
// 3003 - Override

void lighton() {
	int i;
	if (GetLocalInt(OBJECT_SELF,"hasVfx")==1) {
		for (i=0; i<=GetLocalInt(OBJECT_SELF,"vfxCount"); i++) {
			CreateObject(OBJECT_TYPE_PLACED_EFFECT,GetLocalString(OBJECT_SELF,"vfxBlueprint"),GetLocalLocation(OBJECT_SELF,"vfxLocation"+IntToString(i)),FALSE,GetLocalString(OBJECT_SELF,"vfxTag"));
		}
	}
	for (i=0; i<=GetLocalInt(OBJECT_SELF,"lightCount"); i++) {
		CreateObject(OBJECT_TYPE_LIGHT,GetLocalString(OBJECT_SELF,"lightBlueprint"),GetLocalLocation(OBJECT_SELF,"lightLocation"+IntToString(i)),FALSE,GetLocalString(OBJECT_SELF,"lightTag"));
	}
	SetLocalInt(OBJECT_SELF,"status",1);
}

void lightoff() {
	int i;
	if (GetLocalInt(OBJECT_SELF,"hasVfx")==1) {
		for (i=0; i<=GetLocalInt(OBJECT_SELF,"vfxCount"); i++) {
			DestroyObject(GetObjectByTag(GetLocalString(OBJECT_SELF,"vfxTag"),i));
		}
	}
	for (i=0; i<=GetLocalInt(OBJECT_SELF,"lightCount"); i++) {
		DestroyObject(GetObjectByTag(GetLocalString(OBJECT_SELF,"lightTag"),i));
	}
	SetLocalInt(OBJECT_SELF,"status",-1);
}

void override() {
	// if light is on, turn off
	// if light is off, turn on
	if (GetLocalInt(OBJECT_SELF,"status")==1) {
		lightoff();
	} else {
		lighton();
	}
}

void update() {
	// figure out if this light should be on and switch if in wrong state
	int onHours = GetLocalInt(OBJECT_SELF,"onHours");
	int offHours = GetLocalInt(OBJECT_SELF,"offHours");
	int curHour = GetTimeHour();
	int status = GetLocalInt(OBJECT_SELF,"status");
	if (onHours>offHours) { 
		if (curHour<offHours) {
			// on
			if (status==-1) {
				lighton();
			}
		} else {
			if (curHour>=onHours) {
				// on
				if (status==-1) {
					lighton();
				}
			} else {
				// off
				if (status==1) {
					lightoff();
				}
			}
		}
	} else {
		if (curHour<onHours) {
			// off
			if (status==1) {
				lightoff();
			}
		} else {
			if (curHour>=offHours) {
				// off
				if (status==1) {
					lightoff();
				}
			} else {
				// on
				if (status==-1) {
					lighton();
				}
			}
		}
	}
}

void init() {
	// light only needs initialzing once
	// so check if it's done already
	// if status is not set then init otherwise just update.
	if (GetLocalInt(OBJECT_SELF,"status")==0) {
		// lights in the toolset should be built switched on
		// therefore init status to "on"
		SetLocalInt(OBJECT_SELF,"status",1);
		
		// save locations for the vfx and lights
		// so we know where to put them later
		if (GetLocalInt(OBJECT_SELF,"hasVfx")==1) {
			string vfxTag = GetLocalString(OBJECT_SELF,"vfxTag");
			int vfxCount = 0;
			object oVfx = GetObjectByTag(vfxTag,vfxCount);
			while (oVfx != OBJECT_INVALID) {
				SetLocalLocation(OBJECT_SELF,"vfxLocation"+IntToString(vfxCount),GetLocation(oVfx));
				vfxCount++;
				oVfx = GetObjectByTag(vfxTag,vfxCount);
			}
			vfxCount--;
			SetLocalInt(OBJECT_SELF,"vfxCount",vfxCount);		
		}
		string lightTag = GetLocalString(OBJECT_SELF,"lightTag");
		int lightCount = 0;
		object oLight = GetObjectByTag(lightTag,lightCount);
		while (oLight != OBJECT_INVALID) {
			SetLocalLocation(OBJECT_SELF,"lightLocation"+IntToString(lightCount),GetLocation(oLight));
			lightCount++;
			oLight = GetObjectByTag(lightTag,lightCount);
		}
		lightCount--;
		SetLocalInt(OBJECT_SELF,"lightCount",lightCount);		
	}
		
	update();
}

void main() {
	int eventno = GetUserDefinedEventNumber();
	if (eventno==3001) {
		// Initialise Light
		init();
	} else {
		if (eventno==3002) {
			// Update Light
			update();
		} else {
			if (eventno==3003) {
				// Override Light
				override();
			}
		}
	}

}