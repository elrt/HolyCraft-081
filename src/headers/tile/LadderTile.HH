// Batch026 partial source API; not original C++ ABI.
class LadderTile {Tile base;};
Bool LadderTile_Init(LadderTile *s,MCRegistry023 *r,I32 id);
U0 LadderTile_getAABB(LadderTile *s,Level *l,I32 x,I32 y,I32 z,AABB *out);
Bool LadderTile_mayPlace(LadderTile *s,MCWorld023 *w,I32 x,I32 y,I32 z);
I32 LadderTile_getPlacementDataValue(LadderTile *s,MCWorld023 *w,I32 x,I32 y,I32 z,I32 face,I32 old);
U0 LadderTile_neighborChanged(LadderTile *s,Level *l,I32 x,I32 y,I32 z);
