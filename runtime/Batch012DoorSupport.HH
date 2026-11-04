#ifndef MCPE_BATCH012_DOOR_SUPPORT
#define MCPE_BATCH012_DOOR_SUPPORT
class MCDoorNode012 {I32 x,y,z;};class MCDoorHost012 {U0 *host;Random *random;Bool collided,pathPresent,pathDone,canOpenDoors;F32 x,y,z;I32 difficulty,doorWoodID;I32 (*pathIndex)(U0 *);I32 (*pathSize)(U0 *);MCDoorNode012 *(*pathNode)(U0 *,I32);F32 (*distanceSqr)(U0 *,F32,F32,F32);I32 (*getTile)(U0 *,I32,I32,I32);U0 *(*tileByID)(U0 *,I32);Bool (*doorIsOpen)(U0 *,I32,I32,I32);U0 (*setDoorOpen)(U0 *,U0 *,I32,I32,I32,Bool);U0 (*setTile)(U0 *,I32,I32,I32,I32,I32);U0 (*levelEvent)(U0 *,I32,I32,I32,I32,I32);};
#endif
