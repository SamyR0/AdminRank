#include <sourcemod>
#include <cstrike>

public Plugin:myinfo =
{
   name = "adminrank",
   description = "Adds ranks to the staff.",
   author = "SamyR0",
   version = "1.0.0",
   url = "https://github.com/SamyR0"
};


public OnPluginStart()
{
   HookEvent("player_team", Event, EventHookMode:1);
   HookEvent("player_spawn", Event, EventHookMode:1);
}

public OnClientPutInServer(client)
{
   HandleTag(client);
}

public Action:Event(Handle:event, String:name[], bool:dontBroadcast)
{
   new client = GetClientOfUserId(GetEventInt(event, "userid"));
   if (0 < client) {
      HandleTag(client);
   }
   return Plugin_Continue;
}

HandleTag(client)
{ 
   if (GetUserFlagBits(client) & ADMFLAG_ROOT) { 
      CS_SetClientClanTag(client, "=[Owner]="); 
   } else if (GetUserFlagBits(client) & ADMFLAG_GENERIC) { 
      CS_SetClientClanTag(client, "=[Chief-Admin]="); 
   } else if (GetUserFlagBits(client) & ADMFLAG_RESERVATION) { 
      CS_SetClientClanTag(client, "=[VIP]="); 
   } else {
      CS_SetClientClanTag(client, "[Pleb]");
   }													
}
