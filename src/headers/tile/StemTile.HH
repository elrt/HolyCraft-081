// Batch023: tile/StemTile; explicit simulation ABI, see docs/BATCH023.md.
class StemTile {MCWorld023 *w;I32 id,fruit,seed;};
U0 StemTile_Init(StemTile*,MCWorld023*,I32,I32,I32);I32 StemTile_getConnectDir(StemTile*,I32,I32,I32);F32 StemTile_getGrowthSpeed(StemTile*,I32,I32,I32);U0 StemTile_tick(StemTile*,I32,I32,I32);Bool StemTile_onFertilized(StemTile*,I32,I32,I32);I32 StemTile_getColor(I32);U0 StemTile_spawnResources(StemTile*,I32,I32,I32,I32);F32 StemTile_height(I32);
