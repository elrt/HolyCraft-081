// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class MCUnsaved024 {I32 x,z;MCVector bytes;};
class ExternalFileLevelStorage {MCString folder;RegionFile region;MCVector pending;I32 ticks;};

U0 ExternalFileLevelStorage_Init(ExternalFileLevelStorage *s,U8 *folder);
Bool ExternalFileLevelStorage_readLevelData(U8 *folder,LevelData *out);
Bool ExternalFileLevelStorage_writeLevelData(U8 *folder,LevelData *data,I32 epoch);
U0 ExternalFileLevelStorage_queue(ExternalFileLevelStorage *s,I32 x,I32 z,MCVector *data);
I32 ExternalFileLevelStorage_savePendingUnsavedChunks(ExternalFileLevelStorage *s,I32 count);
U0 ExternalFileLevelStorage_Destroy(ExternalFileLevelStorage *s);
