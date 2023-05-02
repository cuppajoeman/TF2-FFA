#include <sourcemod>

// How to setup for development: https://www.youtube.com/watch?v=QF7urRJIgrE
// https://www.reddit.com/r/tf2/comments/30b6pe/deathmatch_maps/
// Download steamcmd and then install tf2 and then compile and then put in and then start server.
// https://developer.valvesoftware.com/wiki/Source_Dedicated_Server#For_modders


public Plugin myinfo = {
	name = "FFA",
	description = "Free for All Death Match",
	author = "cuppajoeman",
	version = "1.0",
	url = "https://cuppajoeman.com"
}

public void OnPluginStart()
{
	PrintToServer("Hello world!");
	HookEvent("player_spawn", Event_PlayerSpawn, EventHookMode_Pre)
	HookEvent("player_death")
	
	// Disable objectives like pushing cart and capping points
}

public Action Event_PlayerSpawn(Handle event, const char[] name, bool dontBroadcast) {
	// Move player to correct location
}

public Action Event_PlayerDeath(Handle event, const char[] name, bool dontBroadcast) {
	// Write info about who killed who in the chat
	// Heal the player who killed this person
	// Reload their ammo too?
	return Plugin_Continue;
}

// Step one, make it so that you can attack team players
// overwrite spawn timing
// Step two make it so that when you respawn, you move to one of the spawn locations
// When you kill someone keep track of score.

// You can get all of this information from soapdm

