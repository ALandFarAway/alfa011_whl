// SLS: Scripted Lighting System
// Global include for SLS
// Brendan Ellis (slayweb.com): 2006-11-14

void sls_onenter() {
	// set a global int of the current hour
	// so the heartbeat can montior when it changes
	SetGlobalInt("lightHour",GetTimeHour());
	
	// Loop though all light fittings in the area
	// and signal them to initialise
	event evt = EventUserDefined(3001);
	int i = 0;
	object fitting = GetObjectByTag("lightfitting",i);
	while (fitting != OBJECT_INVALID) {
		SignalEvent(fitting,evt);
		i++;
		fitting = GetObjectByTag("lightfitting",i);
	}
}

void sls_heartbeat() {
	// check if the hour has changed since it was last stored
	if (GetGlobalInt("lightHour")!=GetTimeHour()) {
		// if it has changed, update global int then
		// loop though all light fittings in the area
		// and signal them to update
		SetGlobalInt("lightHour",GetTimeHour());
		event evt = EventUserDefined(3002);
		int i = 0;
		object fitting = GetObjectByTag("lightfitting",i);
		while (fitting != OBJECT_INVALID) {
			SignalEvent(fitting,evt);
			i++;
			fitting = GetObjectByTag("lightfitting",i);
		}
	}
}