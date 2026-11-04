// Batch023: tile/FurnaceTile; explicit simulation ABI, see docs/BATCH023.md.
class FurnaceTile {MCWorld023 *w;Bool lit;Random random;};
U0 FurnaceTile_Init(FurnaceTile*,MCWorld023*,Bool);U0 FurnaceTile_setLit(MCWorld023*,I32,I32,I32,Bool);I32 FurnaceTile_getTexture(FurnaceTile*,I32,I32,Bool);I32 FurnaceTile_getPlacementDataValue(F32,I32);U0 FurnaceTile_animateTick(FurnaceTile*,I32,I32,I32);Bool FurnaceTile_use(FurnaceTile*,I32,I32,I32,MCPlayer023*);U0 FurnaceTile_onRemove(FurnaceTile*,I32,I32,I32);
