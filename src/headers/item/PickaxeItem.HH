// Batch 009: minecraftpe/headers/item/PickaxeItem.hpp
class PickaxeItem { DiggerItem base;MCToolTiles009 *tiles; };
U0 PickaxeItem_Init(PickaxeItem *s,MCItemContext009 *c,I32 id,MCToolTier009 *tier,MCToolTiles009 *tiles);F32 PickaxeItem_getDestroySpeed(PickaxeItem *s,MCToolTile009 *tile);Bool PickaxeItem_canDestroySpecial(PickaxeItem *s,MCToolTile009 *tile);
