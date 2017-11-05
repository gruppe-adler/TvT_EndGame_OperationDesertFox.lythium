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
  [3] remoteExec ["GRAD_replay_init", 0, true];

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


  ////////////////////////////////////////////////////////// QUICK + DIRTY

  slingloadingdummy_1 addItemCargoGlobal ["ItemGPS",1];
  slingloadingdummy_1 addMagazineCargoGlobal ['SmokeShell',20];
  slingloadingdummy_1 addMagazineCargoGlobal ['SmokeShellRed',20];
  slingloadingdummy_1 addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow',30];
  slingloadingdummy_1 addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag',30];
  slingloadingdummy_1 addMagazineCargoGlobal ['16Rnd_9x21_Mag',20];
  slingloadingdummy_1 addWeaponCargoGlobal ['rhs_weap_M136_hedp',4];
  slingloadingdummy_1 addMagazineCargoGlobal ['rhs_200rnd_556x45_T_SAW',10];
  slingloadingdummy_1 addMagazineCargoGlobal ['rhs_200rnd_556x45_M_SAW',10];
  slingloadingdummy_1 addMagazineCargoGlobal ['HandGrenade',20];
  slingloadingdummy_1 addMagazineCargoGlobal ['rhs_mag_m714_White',15];
  slingloadingdummy_1 addMagazineCargoGlobal ['rhs_mag_m713_Red',15];
  slingloadingdummy_1 addMagazineCargoGlobal ['rhs_mag_m661_green',15];
  slingloadingdummy_1 addMagazineCargoGlobal ["rhs_mag_smaw_HEAA",5];
  slingloadingdummy_1 addItemCargoGlobal ['ACE_Earplugs',15];
  slingloadingdummy_1 addItemCargoGlobal ['ACE_Morphine',40];
  slingloadingdummy_1 addItemCargoGlobal ['ACE_epinephrine',40];
  slingloadingdummy_1 addItemCargoGlobal ['ACE_fieldDressing',100];
  slingloadingdummy_1 addItemCargoGlobal ['ACE_bloodIV_250',20];
  slingloadingdummy_1 addItemCargoGlobal ['ItemGPS',5];
  slingloadingdummy_1 addItemCargoGlobal ['ACE_HuntIR_monitor',2];
  slingloadingdummy_1 addMagazineCargoGlobal ['ACE_HuntIR_M203',4];
  ['AddCargoByClass', ['ACE_wheel', slingloadingdummy_1, 3], slingloadingdummy_1] call CBA_fnc_targetEvent;
  ['AddCargoByClass', ['ACE_Track', slingloadingdummy_1, 1], slingloadingdummy_1] call CBA_fnc_targetEvent;

  ////

  slingloadingdummy_2 addItemCargoGlobal ["ItemGPS",1];
  slingloadingdummy_2 addMagazineCargoGlobal ['SmokeShell',20];
  slingloadingdummy_2 addMagazineCargoGlobal ['SmokeShellRed',20];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_30Rnd_762x39mm_tracer',30];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_30Rnd_762x39mm',30];
  slingloadingdummy_2 addMagazineCargoGlobal ['16Rnd_9x21_Mag',20];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_rpg7_PG7VL_mag',5];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_rpg7_PG7VR_mag',5];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR_green',10];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR',10];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_mag_rgd5',20];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_GRD40_White',10];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_GRD40_Green',10];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_GRD40_Red',10];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_VG40OP_white',10];
  slingloadingdummy_2 addMagazineCargoGlobal ['rhs_VG40OP_green',10];
  slingloadingdummy_2 addItemCargoGlobal ['ACE_Earplugs',40];
  slingloadingdummy_2 addItemCargoGlobal ['ACE_Morphine',40];
  slingloadingdummy_2 addItemCargoGlobal ['ACE_epinephrine',40];
  slingloadingdummy_2 addItemCargoGlobal ['ACE_fieldDressing',100];
  slingloadingdummy_2 addItemCargoGlobal ['ItemGPS',5];
  slingloadingdummy_2 addItemCargoGlobal ['ACE_bloodIV_250',20];
  ['AddCargoByClass', ['ACE_wheel', slingloadingdummy_2, 3], slingloadingdummy_2] call CBA_fnc_targetEvent;
  ['AddCargoByClass', ['ACE_Track', slingloadingdummy_2, 1], slingloadingdummy_2] call CBA_fnc_targetEvent;
};
