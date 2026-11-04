// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class ChestTileEntity {TileEntity base;FillingContainer container;ChestTileEntity *pair;Bool primary,sameX;I32 openCount,ticks;F32 lid,previousLid;};

U0 ChestTileEntity_Init(ChestTileEntity *s,MCRegistry023 *registry);
U0 ChestTileEntity_unpair(ChestTileEntity *s);
U0 ChestTileEntity_Destroy(ChestTileEntity *s);
Bool ChestTileEntity_canPairWith(ChestTileEntity *s,ChestTileEntity *other);
U0 ChestTileEntity_pairWith(ChestTileEntity *s,ChestTileEntity *other,Bool primary);
I32 ChestTileEntity_getContainerSize(ChestTileEntity *s);
ItemInstance *ChestTileEntity_getItem(ChestTileEntity *s,I32 slot);
Bool ChestTileEntity_canOpen(ChestTileEntity *s);
U0 ChestTileEntity_startOpen(ChestTileEntity *s);
U0 ChestTileEntity_stopOpen(ChestTileEntity *s);
U0 ChestTileEntity_tick(ChestTileEntity *s);
Bool ChestTileEntity_save(ChestTileEntity *s,CompoundTag *tag);
U0 ChestTileEntity_load(ChestTileEntity *s,CompoundTag *tag);
