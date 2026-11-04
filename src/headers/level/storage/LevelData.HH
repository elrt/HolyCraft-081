// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class LevelData {MCString levelName;I32 seed,xSpawn,ySpawn,zSpawn,time,lastPlayed,sizeOnDisk,dimensionID,gameType,storageVersion,stopTime,generatorVersion;Bool spawnMobs;CompoundTag *playerTag;};

U0 LevelData_Init(LevelData *s);
U0 LevelData_Destroy(LevelData *s);
U0 LevelData_setPlayerTag(LevelData *s,CompoundTag *tag);
U0 LevelData_Copy(LevelData *s,LevelData *other);
U0 LevelData_InitSettings(LevelData *s,I32 seed,I32 game,I32 generator,U8 *name);
U0 LevelData_getTagData(LevelData *s,CompoundTag *tag);
U0 LevelData_setTagData(LevelData *s,CompoundTag *tag,CompoundTag *ownedPlayer,I32 epoch);
CompoundTag *LevelData_createTag(LevelData *s,I32 epoch);
