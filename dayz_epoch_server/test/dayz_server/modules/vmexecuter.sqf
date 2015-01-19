    [] spawn {
            waitUntil {!isnull finddisplay 46};
            waitUntil {!isNil 'dayz_animalCheck'};
            fnc_adminVMexecuter =
            {
                          if !((getPlayerUID player) in (PV_SuperLevel_List)) exitWith {};
                    infiSTAR_ExecVM =
                    [
                            ['',true],
                            ['infiSTAR.de SQF Loader', [-1], '', -5, [['expression', '']], '1', '0'],
                            ['Kit 1', [2], '', -5, [['expression', '[] execVM ''events\1.sqf'';']], '1', '1'],
                            ['Kit 2', [3], '', -5, [['expression', '[] execVM ''events\2.sqf'';']], '1', '1'],
                            ['Kit 3', [4], '', -5, [['expression', '[] execVM ''events\3.sqf'';']], '1', '1'],
                            ['Construction', [5], '', -5, [['expression', '[] execVM ''events\Construction.sqf'';']], '1', '1'],
                            ['Military', [6], '', -5, [['expression', '[] execVM ''events\Military.sqf'';']], '1', '1'],
                            ['Treasure', [7], '', -5, [['expression', '[] execVM ''events\Treasure.sqf'';']], '1', '1']							
                    ];
                    showCommandingMenu '#USER:infiSTAR_ExecVM';
            };
            fnc_adminStartKeybinds =
            {
                    _keyDown = _this select 1;
                    if (_keyDown == 61) then
                    {
                            [] spawn fnc_adminVMexecuter;
                    };
            };
            while {1 == 1} do
            {
                    if (!isNil 'adminStartKeybinds') then {(findDisplay 46) displayRemoveEventHandler ['KeyDown', adminStartKeybinds];adminStartKeybinds = nil;};
                    adminStartKeybinds = (findDisplay 46) displayAddEventHandler ['KeyDown','_this call fnc_adminStartKeybinds'];
                    sleep 5;
            };
    };

