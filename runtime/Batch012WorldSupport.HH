#ifndef MCPE_BATCH012_WORLD_SUPPORT
#define MCPE_BATCH012_WORLD_SUPPORT
extern "c" F64 cos(F64);
class MCWorldHost012 {U0 *host;I32 invisibleBedrock;I32 (*topTile)(U0 *,I32,I32);Bool (*tileSolid)(U0 *,I32);U0 *(*createBiome)(U0 *);U0 (*destroyBiome)(U0 *,U0 *);U0 *(*createRandomSource)(U0 *,I32,I32,Bool);I32 (*seed)(U0 *);I32 (*generatorVersion)(U0 *);Bool (*isClient)(U0 *);Bool (*spawnMobs)(U0 *);U0 *(*createChunk)(U0 *,U8 *,I32,I32);U0 (*recalcHeightmap)(U0 *,U0 *);};
#endif
