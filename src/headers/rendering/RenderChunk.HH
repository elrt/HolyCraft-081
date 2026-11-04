// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class RenderChunk {MCWorld024 *world;MCGeometry024 *host;Tesselator layers[4];I32 x,y,z,size,blockX,blockY,blockZ,renderLists;MC023Shape bounds;Bool dirty,built,frustum,skip[4];I32 updates;};

U0 RenderChunk_setPos(RenderChunk *s,I32 x,I32 y,I32 z);
U0 RenderChunk_Init(RenderChunk *s,MCWorld024 *w,MCGeometry024 *host,I32 x,I32 y,I32 z,I32 size,I32 lists);
U0 RenderChunk_Destroy(RenderChunk *s);
F32 RenderChunk_distanceToSqr(RenderChunk *s,F32 x,F32 y,F32 z);
F32 RenderChunk_squishedDistanceToSqr(RenderChunk *s,F32 x,F32 y,F32 z);
I32 RenderChunk_getList(RenderChunk *s,I32 layer);
Bool RenderChunk_rebuild(RenderChunk *s);
