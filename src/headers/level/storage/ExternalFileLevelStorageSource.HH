// Batch022: level/storage/ExternalFileLevelStorageSource; explicit host ABI, see docs/BATCH022.md.
class MCStorageHost022 {U0 *ctx;Bool (*exists)(U0*,MCString*);Bool (*mkdir)(U0*,MCString*);Bool (*removeTree)(U0*,MCString*);Bool (*removeFile)(U0*,MCString*);Bool (*listDirs)(U0*,MCString*,MCVector*);Bool (*summary)(U0*,MCString*,U0*);Bool (*gzip)(U0*,MCString*,MCString*,Bool);U0 *(*select)(U0*,MCString*,MCString*);};
class ExternalFileLevelStorageSource {MCString primary,secondary,cache;Bool separate;MCStorageHost022 *host;};
U0 ExternalFileLevelStorageSource_Init(ExternalFileLevelStorageSource*,MCString*,MCString*,MCStorageHost022*);U0 ExternalFileLevelStorageSource_Destroy(ExternalFileLevelStorageSource*);
U0 ExternalFileLevelStorageSource_getFullPath(ExternalFileLevelStorageSource*,MCString*,Bool,MCString*);
Bool ExternalFileLevelStorageSource_getLevelSummaryIfExists(ExternalFileLevelStorageSource*,MCString*,U0*);U0 ExternalFileLevelStorageSource_getLevelList(ExternalFileLevelStorageSource*,MCVector*);
Bool ExternalFileLevelStorageSource_deleteLevel(ExternalFileLevelStorageSource*,MCString*,Bool);Bool ExternalFileLevelStorageSource_clearCache(ExternalFileLevelStorageSource*);
Bool ExternalFileLevelStorageSource_storeToCache(ExternalFileLevelStorageSource*,MCString*,Bool,I32,I32);Bool ExternalFileLevelStorageSource_loadFromCache(ExternalFileLevelStorageSource*,MCString*,Bool,I32,I32);U0 *ExternalFileLevelStorageSource_selectLevel(ExternalFileLevelStorageSource*,MCString*,Bool);


U8 *ExternalFileLevelStorageSource_getName();Bool ExternalFileLevelStorageSource_isNewLevelIdAcceptable(MCString*);
U0 ExternalFileLevelStorageSource_getFullPathForID(ExternalFileLevelStorageSource*,MCString*,MCString*,MCString*);

