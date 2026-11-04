// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class Level {MCRegistry023 *registry;MCWorld023 world;MCInteraction023 actions;MCWorld024 adapter;LevelData data;LevelChunk *chunks[256];Tile *tileObjects[256];MCPtrVector bodies,drops;MCVector pendingTicks;I32 skyDarken,eventCount[64],ticks,dayTime,chunkLimit;Bool noSky;U0 *ctx;U0 (*event)(U0*,MCWorldEvent023*);U0 (*tileTick)(U0*,I32,I32,I32,I32);};

Bool Level_InBounds(I32 x,I32 y,I32 z);
LevelChunk *Level_getChunk(Level *s,I32 x,I32 z,Bool create);
I32 Level_getTile(Level *s,I32 x,I32 y,I32 z);
I32 Level_getData(Level *s,I32 x,I32 y,I32 z);
Bool Level_setTileAndData(Level *s,I32 x,I32 y,I32 z,I32 id,I32 meta,I32 flags);
I32 MC025_LevelGet(U0 *ctx,I32 op,I32 x,I32 y,I32 z);
Bool MC025_LevelSet(U0 *ctx,I32 op,I32 x,I32 y,I32 z,I32 id,I32 meta,I32 flags);
U0 Level_getCubes(Level *s,AABB *box,MCVector *out);
U0 Level_clipMove(Level *s,AABB *box,F32 *dx,F32 *dy,F32 *dz);
U0 MC025_MoveBody(U0 *ctx,MCBody023 *body,F32 dx,F32 dy,F32 dz);
U0 MC025_Entities(U0 *ctx,MCBody023 *except,F32 x,F32 y,F32 z,F32 xx,F32 yy,F32 zz,MCPtrVector *out);
U0 MC025_LevelEvent(U0 *ctx,MCWorldEvent023 *e);
F32 MC025_LevelValue(U0 *ctx,I32 op,I32 x,I32 y,I32 z);
U0 Level_Init(Level *s,MCRegistry023 *r,I32 seed);
U0 Level_Destroy(Level *s);
U0 Level_addEntity(Level *s,MCBody023 *body);
U0 Level_removeEntity(Level *s,MCBody023 *body);
U0 Level_addToTickNextTick(Level *s,I32 x,I32 y,I32 z,I32 id,I32 delay);
U0 Level_tick(Level *s);
Bool Level_saveChunks(Level *s,RegionFile *file);
Bool Level_loadChunk(Level *s,RegionFile *file,I32 x,I32 z);

Bool MC025_CanDestroy(U0 *ctx,MCPlayer023 *player,I32 id);
U0 MC025_MineItem(U0 *ctx,ItemInstance *item,I32 id,I32 x,I32 y,I32 z,MCPlayer023 *player);
U0 *MC025_BlockEntity(U0 *ctx,I32 x,I32 y,I32 z);
Bool Level_setBlockEntity(Level *s,I32 x,I32 y,I32 z,I32 kind,U0 *object);

Bool Level_hasChunksAt(Level *s,I32 x,I32 y,I32 z,I32 xx,I32 yy,I32 zz);
