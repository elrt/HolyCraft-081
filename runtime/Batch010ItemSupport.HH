#ifndef MCPE_BATCH010_ITEM_SUPPORT
#define MCPE_BATCH010_ITEM_SUPPORT
extern "c" F32 atan2f(F32 y,F32 x);
extern "c" F32 sqrtf(F32 x);
// Snapshots and callback interface supplied by the world/inventory host.
class MCItemContext010 { U0 *host; MCItemContext009 *items; MCPlaceContext009 *place; F32 yaw,timeOfDay,playerX,playerZ;I32 spawnX,spawnZ,arrowID,bedID,woodDoorID,ironDoorID,signID,wallSignID;U8 *dyeDescription;Bool woodDoor,solidMaterial;I32 grassID,dirtID,farmlandID,wheatSeedID,beetSeedID,clothID;Bool sheepSheared;I32 sheepType,sheepColor;
 Bool (*hasResource)(U0 *,I32); U0 (*removeResource)(U0 *,I32); U0 (*clearSelected)(U0 *); U0 (*spawnArrow)(U0 *,F32,Bool);
 Bool (*isSolid)(U0 *,I32,I32,I32); Bool (*tileMayPlace)(U0 *,I32,I32,I32,I32);U0 (*neighbors)(U0 *,I32,I32,I32,I32); U0 (*openTextEdit)(U0 *,I32,I32,I32); Bool (*fertilize)(U0 *,I32,I32,I32,I32);U0 (*setSheepColor)(U0 *,I32); U0 (*spawnSeed)(U0 *,I32,F32,F32,F32,I32);
};
I32 MC010_floor(F32 x) { I32 i=x; if(x<i)i--;return i; }
#endif
