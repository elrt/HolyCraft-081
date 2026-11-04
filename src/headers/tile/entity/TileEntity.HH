// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
I32 MC024_runningId=0;
class TileEntity {MCWorld024 *world;I32 type,id,x,y,z,metadata,cachedTile;Bool removed;MC023Shape bounds;};

U0 TileEntity_Init(TileEntity *s,I32 type);
U0 TileEntity_clearCache(TileEntity *s);
U0 TileEntity_setLevelAndPos(TileEntity *s,MCWorld024 *w,I32 x,I32 y,I32 z);
I32 TileEntity_getData(TileEntity *s);
U0 TileEntity_setData(TileEntity *s,I32 data);
U0 TileEntity_setChanged(TileEntity *s);
U0 TileEntity_setRemoved(TileEntity *s);
F32 TileEntity_distanceToSqr(TileEntity *s,F32 x,F32 y,F32 z);
U0 TileEntity_load(TileEntity *s,CompoundTag *tag);
Bool TileEntity_save(TileEntity *s,CompoundTag *tag);
