#include "USERSCRIPTS\missionsettings.sqf";

RHS_ENGINE_STARTUP_OFF = true;

//LOADOUTS =====================================================================
["BLU_F", "US_Desert"] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", "RU_Desert"] call GRAD_Loadout_fnc_FactionSetLoadout;

//ENGIMA TRAFFIC ===============================================================
CIVILIAN_TRAFFIC = ["civiliantraffic", 0] call BIS_fnc_getParamValue;
if (CIVILIAN_TRAFFIC == 1) then {
  [] execVM "Engima\Traffic\Init.sqf";
};



//SERVER ONLY ==================================================================
if (isServer) then {

  // GRAD REPLAY
  [REPLAY_ACCURACY] remoteExec ["GRAD_replay_init", 0, true];

  _wshndl = [] execVM "helpers\wavesize.sqf";
  waitUntil {scriptDone _wshndl};

  SHOWCARRIERMARKER = (["carriermarker", 0] call BIS_fnc_getParamValue) == 1;
  publicVariable "SHOWCARRIERMARKER";

  OPFOR_ELIMINATED = false;
  BLUFOR_ELIMINATED = false;
  ENDINDRAW = false;
  publicVariable "OPFOR_ELIMINATED";
  publicVariable "BLUFOR_ELIMINATED";
  publicVariable "ENDINDRAW";

  // civilian traffic
  CIV_KILLED_POS = [0,0,0];
  publicVariable "CIV_KILLED_POS";
  CIV_GUNFIGHT_POS = [0,0,0];
  publicVariable "CIV_GUNFIGHT_POS";

  addMissionEventHandler ["HandleDisconnect", {[_this select 3] spawn mcd_fnc_handleRespawned}];

  if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
    [] execVM "server\tfarsettings.sqf";
  };

  //setup scripts
  [] execVM "server\killableLaptops.sqf";
  [] execVM "server\removeFromCleanup.sqf";
  [] execVM "server\clearVehicles.sqf";
  [] execVM "server\objLockAndClear.sqf";
  [] execVM "server\transportHelis.sqf";
  [] execVM "fillContainerInit.sqf";
  [] execVM "server\civKillListener.sqf";
  [] execVM "server\civGunfightListener.sqf";
  ["SERVER"] execVM "helpers\uploadTime.sqf";
  ["FINDOBJS"] spawn mcd_fnc_hideTaskMarkers;

  //mission scripts
  [] execVM "server\respawnVehicles.sqf";
  [] execVM "server\handleRespawns.sqf";
  [] execVM "server\detectAllDead.sqf";
  [] execVM "server\endInDraw.sqf";
  [] execVM "server\uploadSoldiers.sqf";
  [] execVM "server\overwriteReveal.sqf";
  [] execVM "server\skipToEndgame.sqf";

};
