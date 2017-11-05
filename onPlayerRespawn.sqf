/*  Notifies server that player has respawned
*
*   executed locally on respawn
*/

//check JIP player is spawning for the first time
if (serverTime-joinTime < 30 && didJIP) exitWith {diag_log "Player is JIP, not executing onPlayerRespawn.sqf"};

//terminate spectator
[player, false] call TFAR_fnc_forceSpectator;
[false, false, false] call ace_spectator_fnc_setSpectator;
// player hideObjectGlobal false; // doublecheck invisible bug

//notify server
[profileName, originalSide, player] remoteExec ["mcd_fnc_handleRespawned",2,false];

//re-enable map
[false] call mcd_fnc_blockMap;