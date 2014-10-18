// lightsoff.sqf
_pos    = _this select 0;
_range = _this select 1;

// Add more types if needed
_types = ["Land_lampa_vysoka", "Land_lampa_ind", "Land_lampa_ind_b", "Land_lampa_sidl", "Land_lampa_ind_zebr"];
for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
  _lamps = _pos nearObjects [_types select _i, _range];
  Sleep 1;
  {_x switchLight "OFF"} forEach _lamps;
};