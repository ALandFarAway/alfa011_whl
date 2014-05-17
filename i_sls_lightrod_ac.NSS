// SLS: Scripted Lighting System
// "use unique power" for the Rod of Light
// when used will turn the nearest light on/off
// Brendan Ellis (slayweb.com): 2006-11-10

void main() {
	// send override event to nearest light fitting
	SignalEvent(GetNearestObjectByTag("lightfitting",GetItemActivator()),EventUserDefined(3003));
}