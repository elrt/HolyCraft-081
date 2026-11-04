// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class NetherReactorTileEntity {TileEntity base;Bool initialized,finished;I16 progress;I32 phase;};

U0 NetherReactorTileEntity_Init(NetherReactorTileEntity *s);
Bool NetherReactorTileEntity_checkLevelChange(I32 seconds);
I32 NetherReactorTileEntity_getNumEnemiesToSpawn(NetherReactorTileEntity *s);
I32 NetherReactorTileEntity_getNumItemsToSpawn(NetherReactorTileEntity *s);
Bool NetherReactorTileEntity_isEdge(I32 x,I32 radius,I32 z);
U0 NetherReactorTileEntity_buildFloorVolume(NetherReactorTileEntity *s,I32 x,I32 y,I32 z,I32 radius,I32 height,I32 id);
U0 NetherReactorTileEntity_buildHollowedVolume(NetherReactorTileEntity *s,I32 x,I32 y,I32 z,I32 radius,I32 height,I32 wall,I32 inside);
U0 NetherReactorTileEntity_buildCrockedRoofVolume(NetherReactorTileEntity *s,Bool reverse,I32 x,I32 y,I32 z,I32 radius,I32 height,I32 id);
Bool NetherReactorTileEntity_save(NetherReactorTileEntity *s,CompoundTag *tag);
U0 NetherReactorTileEntity_load(NetherReactorTileEntity *s,CompoundTag *tag);
