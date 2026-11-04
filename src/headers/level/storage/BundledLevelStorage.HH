// Batch022: level/storage/BundledLevelStorage; explicit host ABI, see docs/BATCH022.md.
#define MC022_CHUNK_BYTES 82176
class MCBundledHost022 {U0 *ctx;Bool (*readAsset)(U0*,MCString*,MCString*);Bool (*writeAsset)(U0*,MCString*,MCString*);U0 (*heightmap)(U0*,U0*);};
class MCBundledChunk022 {I32 x,z;U8 tiles[32768],meta[16384],sky[16384],block[16384],update[256];Bool unsaved,decorated,loaded;};
class BundledLevelStorage {MCString name;I32 gameType,generatorSeed;Bool spawnMobs;MCBundledHost022 *host;};
U0 BundledLevelStorage_Init(BundledLevelStorage*,MCString*,MCBundledHost022*);U0 BundledLevelStorage_Destroy(BundledLevelStorage*);U0 BundledLevelStorage_prepareLevel(BundledLevelStorage*);
Bool BundledLevelStorage_getChunkData(BundledLevelStorage*,I32,I32,MCString*);MCBundledChunk022 *BundledLevelStorage_load(BundledLevelStorage*,I32,I32);
Bool BundledLevelStorage_saveAsset022(BundledLevelStorage*,MCBundledChunk022*);
