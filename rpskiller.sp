#include <sourcemod>
#include <tf2_stocks>
#include <multicolors>
#include <sdkhooks>
#include <freak_fortress_2>
ConVar g_hCVRpsKiller_Interval;
public Plugin myinfo =
{
    name = "RPS Killer",
    author = "WEEGEE",
    description = "Slay the boss player if it loses in a RPS Taunt",
    version = "1.0",
    url = "https://steamcommunity.com/groups/reachhl2"
}

public void OnPluginStart()
{
    HookEvent("rps_taunt_event", RPS);
    g_hCVRpsKiller_Interval = CreateConVar("rpskiller_interval","3.3","Interval in seconds before it slays the player", FCVAR_NONE, true, 0.1, true, 10.0);
}

public void RPS(Event event, const char[] name, bool dontBroadcast)
{
    DataPack pack;
    int winner = event.GetInt("winner");
    int loser = event.GetInt("loser");
    
    float fSlayDelay = g_hCVRpsKiller_Interval.FloatValue;
    if(IsClientInGame(loser) && IsPlayerAlive(loser) && FF2_GetBossIndex(loser) != -1)
    {
        CreateDataTimer(fSlayDelay, SlayHale, pack);
        pack.WriteCell(winner);
        pack.WriteCell(loser);
    }
}

public Action SlayHale(Handle timer, DataPack pack)
{
    pack.Reset();
    int winner = pack.ReadCell();
    int loser = pack.ReadCell();
    
    if(TF2_GetClientTeam(winner) != TF2_GetClientTeam(loser))
    {
        SDKHooks_TakeDamage(loser, 0, winner, float(FF2_GetBossHealth(FF2_GetBossIndex(loser))), DMG_GENERIC); //Must convert the returned integer to float or the damage won't be correct.
        CPrintToChatAll("{orange}[RPS Killer] {cyan}%N{default}has been slayed for losing a{lightgreen}RPS Taunt.", loser);
    }
}