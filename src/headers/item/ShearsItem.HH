// Batch 009: minecraftpe/headers/item/ShearsItem.hpp
class ShearsItem { MCItem009 base;MCToolTiles009 *tiles; };
U0 ShearsItem_Init(ShearsItem *s,MCItemContext009 *c,I32 id,MCToolTiles009 *tiles);F32 ShearsItem_getDestroySpeed(ShearsItem *s,MCToolTile009 *tile);Bool ShearsItem_canDestroySpecial(ShearsItem *s,MCToolTile009 *tile);Bool ShearsItem_mineBlock(ShearsItem *s,MCItemContext009 *c,MCPacketItem009 *item,I32 tileID);
