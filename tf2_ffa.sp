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
	HookEvent("player_death", Event_PlayerDeath)
	
	LoadSpawnInformation() // x, y, z & yaw, pitch
	
	// Disable objectives like pushing cart and capping points
}

public Action Event_PlayerSpawn(Handle event, const char[] name, bool dontBroadcast) {
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
    int clientid = GetClientUserId(client);
    
    if (!ClientIsRealPlayer(client)) {
    	return Plugin_Continue;
    }
    
    
    
    
}

public Action Event_PlayerDeath(Handle event, const char[] name, bool dontBroadcast) {
	// Write info about who killed who in the chat
	// Heal the player who killed this person
	// Reload their ammo too?
	
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
    int clientid = GetClientUserId(client);

    int isDeadRinger = GetEventInt(event,"death_flags") & 32;
    bool fakeDeath = !ClientIsRealPlayer(client) || isDeadRinger;
    
    if (fakeDeath)
    {
        return Plugin_Continue;
    }
    
    RespawnPlayer(clientid, 1.5)
    
    // If we wanted to be like soap dm we would reload ammo and regen attacker's health.
	
	return Plugin_Continue;
}

void RespawnPlayer(clientid: int, secondsUntilRespawn: float) {
	/* 	description:
	 *		respawns the player with the given id after a certain amount of time */
	CreateTimer(1.5, Respawn, clientid, TIMER_FLAG_NO_MAPCHANGE);
}


bool ClientIsRealPlayer(int client) {
	/*	description:
	 *		returns true if the client is not a replay or an stv bot */
    return ((0 < client <= MaxClients) && IsClientInGame(client) && !IsClientSourceTV(client) && !IsClientReplay(client));
}


public Action Respawn(Handle timer, int clientid) {
	/*	description:
	 * 		respawns a player on a delay */
	 
    int client = GetClientOfUserId(clientid);

    if (!ClientIsRealPlayer(client))
    {
        return Plugin_Continue;
    }

    TF2_RespawnPlayer(client);

    return Plugin_Continue;
}


// Step one, make it so that you can attack team players
// overwrite spawn timing
// Step two make it so that when you respawn, you move to one of the spawn locations
// When you kill someone keep track of score.

// You can get all of this information from soapdm

