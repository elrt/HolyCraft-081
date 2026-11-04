class PoweredRailTile {I32 blockID;U0 *textureUV,*poweredRailTexture;};
U0 PoweredRailTile_Init(PoweredRailTile *,I32,U0 *,U0 *);
Bool PoweredRailTile_isSameRailWithPower(PoweredRailTile *,MCWorld014 *,I32,I32,I32,Bool,I32,I32);
Bool PoweredRailTile_findPoweredRailSignal(PoweredRailTile *,MCWorld014 *,I32,I32,I32,I32,Bool,I32);
U0 *PoweredRailTile_getTexture(PoweredRailTile *);
U0 PoweredRailTile_updateState(PoweredRailTile *,MCWorld014 *,I32,I32,I32,I32,I32,I32);
