// Batch023: entity/FallingTile; explicit simulation ABI, see docs/BATCH023.md.
class FallingTile: MCBody023 {I32 tile,data,fallTime;};
U0 FallingTile_Init(FallingTile*,MCWorld023*,F32,F32,F32,I32,I32);U0 FallingTile_tick(FallingTile*);U0 FallingTile_save(FallingTile*,CompoundTag*);U0 FallingTile_load(FallingTile*,CompoundTag*);
