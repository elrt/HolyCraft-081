// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class LiquidTile {MCWorld024 *world;I32 id,material;};

U0 LiquidTile_Init(LiquidTile *s,MCWorld024 *world,I32 id,I32 material);
I32 LiquidTile_getDepth(LiquidTile *s,I32 x,I32 y,I32 z);
I32 LiquidTile_getRenderedDepth(LiquidTile *s,I32 x,I32 y,I32 z);
Bool LiquidTile_shouldRenderFace(LiquidTile *s,I32 x,I32 y,I32 z,I32 face);
U0 MC024_Normalize(Vec3 *v);
U0 LiquidTile_getFlow(LiquidTile *s,I32 x,I32 y,I32 z,Vec3 *out);
I32 LiquidTile_getTickDelay(LiquidTile *s);
Bool LiquidTile_mayPick(I32 data,Bool flag);
U0 LiquidTile_trySpreadFire(LiquidTile *s,I32 x,I32 y,I32 z,Random *random);
