// Batch023: tile/BedTile; explicit simulation ABI, see docs/BATCH023.md.
class BedTile {MCWorld023 *w;I32 id;};
U0 BedTile_Init(BedTile*,MCWorld023*,I32);U0 BedTile_shape(MC023Shape*);Bool BedTile_findStandUpPosition(BedTile*,I32,I32,I32,I32,TilePos*);U0 BedTile_setOccupied(BedTile*,I32,I32,I32,Bool);U0 BedTile_neighborChanged(BedTile*,I32,I32,I32);Bool BedTile_use(BedTile*,I32,I32,I32,MCPlayer023*);
