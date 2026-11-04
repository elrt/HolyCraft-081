// Batch022: level/Region; explicit host ABI, see docs/BATCH022.md.
class MCRegionHost022 {U0 *ctx;U0 *(*getChunk)(U0*,I32,I32);I32 (*tile)(U0*,U0*,I32,I32,I32);I32 (*data)(U0*,U0*,I32,I32,I32);I32 (*rawLight)(U0*,U0*,I32,I32,I32,I32);Bool (*registered)(U0*,I32);U0 *(*material)(U0*,I32);Bool (*solidRender)(U0*,I32);Bool (*solidBlocking)(U0*,I32);Bool (*cube)(U0*,I32);U0 *(*biome)(U0*,I32,I32);I32 skyDarken,stoneSlab,farmland,woodSlab;F32 lightRamp[16];};
class Region {I32 minCX,minCZ,sizeX,sizeZ;U0 **chunks;MCRegionHost022 *host;};
Bool Region_Init(Region*,MCRegionHost022*,I32,I32,I32,I32);U0 Region_Destroy(Region*);
I32 Region_getTile(Region*,I32,I32,I32);I32 Region_getData(Region*,I32,I32,I32);I32 Region_getRawBrightness(Region*,I32,I32,I32,Bool);F32 Region_getBrightness(Region*,I32,I32,I32);
Bool Region_isEmptyTile(Region*,I32,I32,I32);Bool Region_isSolidRenderTile(Region*,I32,I32,I32);Bool Region_isSolidBlockingTile(Region*,I32,I32,I32);U0 *Region_getMaterial(Region*,I32,I32,I32);U0 *Region_getBiome(Region*,I32,I32);
