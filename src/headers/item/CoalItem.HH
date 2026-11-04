// Batch 009: minecraftpe/headers/item/CoalItem.hpp
class CoalItem { MCItem009 base;TextureUVCoordinateSet iconUV,charcoal; };
U0 CoalItem_Init(CoalItem *s,MCItemContext009 *c,MCPlaceContext009 *p,I32 id,TextureUVCoordinateSet *baseIcon);TextureUVCoordinateSet *CoalItem_getIcon(CoalItem *s,I32 aux,I32 unused,Bool use);U8 *CoalItem_getDescriptionId(CoalItem *s,MCPacketItem009 *it);
