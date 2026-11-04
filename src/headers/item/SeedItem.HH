// Batch 009: minecraftpe/headers/item/SeedItem.hpp
class SeedItem { MCItem009 base;I32 plantId,placeId; };
U0 SeedItem_Init(SeedItem *s,MCItemContext009 *c,I32 id,I32 plant,I32 place);Bool SeedItem_useOn(SeedItem *s,MCItemContext009 *c,MCPacketItem009 *it,I32 x,I32 y,I32 z,I32 face,F32 fx,F32 fy,F32 fz);Bool SeedItem_isSeed(SeedItem *s);
