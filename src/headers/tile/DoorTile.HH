// Batch023: tile/DoorTile; explicit simulation ABI, see docs/BATCH023.md.
class DoorTile {MCWorld023 *w;I32 id;Bool metal;};
U0 DoorTile_Init(DoorTile*,MCWorld023*,I32,Bool);I32 DoorTile_getCompositeData(DoorTile*,I32,I32,I32);U0 DoorTile_shape(I32,MC023Shape*);Bool DoorTile_setOpen(DoorTile*,I32,I32,I32,Bool);Bool DoorTile_use(DoorTile*,I32,I32,I32);Bool DoorTile_mayPlace(DoorTile*,I32,I32,I32);U0 DoorTile_neighborChanged(DoorTile*,I32,I32,I32,I32);
