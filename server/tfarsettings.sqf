/*  TFAR settings
*
*   executed on server via init.sqf
*/


//AUTOMATIC RADIOS
if (isNil "AUTOMATICRADIOS") then {AUTOMATICRADIOS = false};
if (AUTOMATICRADIOS) then {
  TFAR_giveMicroDagrToSoldier = true;
  TFAR_givePersonalRadioToRegularSoldier = true;
  tf_no_auto_long_range_radio = false;
} else {
  TFAR_giveMicroDagrToSoldier = false;
  TFAR_givePersonalRadioToRegularSoldier = false;
  tf_no_auto_long_range_radio = true;
};
publicVariable "TFAR_giveMicroDagrToSoldier";
publicVariable "TFAR_givePersonalRadioToRegularSoldier";
publicVariable "tf_no_auto_long_range_radio";


//DEFAULT RADIOS
if (isNil "BLUFORSWRADIO") then {
  TFAR_DefaultRadio_Rifleman_West = "tf_anprc152";
  TFAR_DefaultRadio_Personal_West = "tf_anprc152";
} else {
  TFAR_DefaultRadio_Rifleman_West = BLUFORSWRADIO;
  TFAR_DefaultRadio_Personal_West = BLUFORSWRADIO;
};

if (isNil "OPFORSWRADIO") then {
  TFAR_DefaultRadio_Rifleman_East = "tf_fadak";
  TFAR_DefaultRadio_Personal_East = "tf_fadak";
} else {
  TFAR_DefaultRadio_Rifleman_East = OPFORSWRADIO;
  TFAR_DefaultRadio_Personal_East = OPFORSWRADIO;
};

if (isNil "BLUFORLRRADIO") then {
  TFAR_DefaultRadio_Backpack_West = "tf_rt1523g_big_rhs";
} else {
  TFAR_DefaultRadio_Backpack_West = BLUFORLRRADIO;
};

if (isNil "OPFORLRRADIO") then {
  TFAR_DefaultRadio_Backpack_East = "tf_mr3000_rhs";
} else {
  TFAR_DefaultRadio_Backpack_East = OPFORLRRADIO;
};
publicVariable "TFAR_DefaultRadio_Rifleman_West";
publicVariable "TFAR_DefaultRadio_Personal_West";
publicVariable "TFAR_DefaultRadio_Rifleman_East";
publicVariable "TFAR_DefaultRadio_Personal_East";
publicVariable "TFAR_DefaultRadio_Backpack_West";
publicVariable "TFAR_DefaultRadio_Backpack_East";


//SAME ENCRYPTION
if (isNil "SAMEENCRYPTION") then {SAMEENCRYPTION = false};
if (SAMEENCRYPTION) then {
  tf_west_radio_code = "AAAAAAA";
  tf_east_radio_code = "AAAAAAA";
  tf_guer_radio_code = "AAAAAAA";
  publicVariable "tf_west_radio_code";
  publicVariable "tf_east_radio_code";
  publicVariable "tf_guer_radio_code";
};


//SETTINGS
tf_same_lr_frequencies_for_side = true;
tf_same_sw_frequencies_for_side = true;
TF_terrain_interception_coefficient = 6.0;
publicVariable "tf_same_lr_frequencies_for_side";
publicVariable "tf_same_sw_frequencies_for_side";
publicVariable "TF_terrain_interception_coefficient";
