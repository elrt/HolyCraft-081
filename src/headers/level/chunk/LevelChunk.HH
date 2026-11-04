// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
Bool LevelChunk_touchedSky025=FALSE;
class LevelChunk {Level *level;MCRegistry023 *registry;I32 chunkX,chunkZ,topBlockY;U8 *tiles,heightMap[256],updateMap[256];DataLayer tileMeta,skyLight,blockLight;Bool loaded,decorated,unsaved,hasNoSky;MCVector blockEntities;};

U0 LevelChunk_Init(LevelChunk *s,MCRegistry023 *r,I32 x,I32 z);
U0 LevelChunk_Destroy(LevelChunk *s);
Bool MC025_Local(I32 x,I32 y,I32 z);
I32 LevelChunk_getTile(LevelChunk *s,I32 x,I32 y,I32 z);
I32 LevelChunk_getData(LevelChunk *s,I32 x,I32 y,I32 z);
U0 LevelChunk_setTileRaw(LevelChunk *s,I32 x,I32 y,I32 z,I32 id);
U0 LevelChunk_recalcColumn(LevelChunk *s,I32 x,I32 z,I32 start);
U0 LevelChunk_recalcHeightmap(LevelChunk *s);
Bool LevelChunk_setData(LevelChunk *s,I32 x,I32 y,I32 z,I32 n);
Bool LevelChunk_setTileAndData(LevelChunk *s,I32 x,I32 y,I32 z,I32 id,I32 meta);
Bool LevelChunk_setTile(LevelChunk *s,I32 x,I32 y,I32 z,I32 id);
I32 LevelChunk_getHeightmap(LevelChunk *s,I32 x,I32 z);
I32 LevelChunk_getBrightness(LevelChunk *s,I32 layer,I32 x,I32 y,I32 z);
U0 LevelChunk_setBrightness(LevelChunk *s,I32 layer,I32 x,I32 y,I32 z,I32 n);
I32 LevelChunk_getRawBrightness(LevelChunk *s,I32 x,I32 y,I32 z,I32 dark);
U0 LevelChunk_clearUpdateMap(LevelChunk *s);
U0 LevelChunk_pack(LevelChunk *s,MCVector *out);
Bool LevelChunk_unpack(LevelChunk *s,MCVector *in,I32 version);
U0 LevelChunk_getRandom(LevelChunk *s,I32 seed,I32 extra,Random *out);
