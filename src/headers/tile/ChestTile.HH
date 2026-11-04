#ifndef MC020_CHESTTILE
#define MC020_CHESTTILE
class ChestTile {MCTileHost020 *h;I32 blockID;Random random;U0 *top,*side,*front;};
U0 ChestTile_Init(ChestTile *s,MCTileHost020 *h,I32 id);
Bool ChestTile_isCubeShaped(ChestTile *s);
I32 ChestTile_getRenderShape(ChestTile *s);
U0 * ChestTile_getTexture(ChestTile *s,I32 face);
U0 * ChestTile_getWorldTexture(ChestTile *s,I32 x,I32 y,I32 z,I32 face);
Bool ChestTile_isSolidRender(ChestTile *s);
U0 ChestTile_onRemove(ChestTile *s,I32 x,I32 y,I32 z);
Bool ChestTile_use(ChestTile *s,I32 x,I32 y,I32 z,U0 *player);
I32 ChestTile_getPlacementDataValue(ChestTile *s,F32 yaw,I32 meta);
U0 ChestTile_Destroy(ChestTile *s);
#endif
