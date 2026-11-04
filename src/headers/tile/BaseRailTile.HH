// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class MCRailPos024 {I32 x,y,z;};
class BaseRailTile {MCWorld024 *world;I32 x,y,z;Bool useDataBit;MCRailPos024 connections[2];I32 connectionCount;MC023Shape shape;};

U0 BaseRailTile_Init(BaseRailTile *s,MCWorld024 *world,I32 x,I32 y,I32 z,Bool bit);
U0 BaseRailTile_updateConnections(BaseRailTile *s,I32 data);
Bool BaseRailTile_hasConnection(BaseRailTile *s,I32 x,I32 z);
Bool BaseRailTile_hasRail(BaseRailTile *s,I32 x,I32 y,I32 z);
I32 BaseRailTile_countPotentialConnections(BaseRailTile *s);
U0 BaseRailTile_updateShape(BaseRailTile *s,I32 meta);
Bool BaseRailTile_mayPlace(BaseRailTile *s);
