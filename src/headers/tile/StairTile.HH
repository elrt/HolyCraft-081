// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class StairTile {MC023Shape shape;};

U0 StairTile_setBaseShape(StairTile *s,I32 meta);
U0 StairTile_updateShape(StairTile *s,Bool octant,I32 index);
Bool StairTile_isDeadSpace(I32 meta,I32 octant);
I32 StairTile_getPlacementDataValue(I32 face,F32 hitY,F32 yaw,I32 aux);
