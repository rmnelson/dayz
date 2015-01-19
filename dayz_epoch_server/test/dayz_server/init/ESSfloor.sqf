_debug = getMarkerPos "respawn_west";

_agent = createAgent ["Survivor2_DZ",_debug,[],0,"CAN_COLLIDE"];
_agent setVehicleInit "this enableSimulation false;this allowDammage false;this disableAI 'FSM';this disableAI 'ANIM';this disableAI 'MOVE';";
processInitCommands;