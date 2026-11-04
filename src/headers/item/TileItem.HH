// Batch 009: minecraftpe/headers/item/TileItem.hpp
class TileItem { MCItem009 base;I32 blockID;TextureUVCoordinateSet icon;I32 (*levelData)(U0 *self,I32 aux);U0 *levelDataSelf;MCPlaceContext009 *place; };
U0 TileItem_Init(TileItem *s,MCItemContext009 *c,MCPlaceContext009 *p,I32 id);Bool TileItem_useOn(TileItem *s,MCItemContext009 *c,MCPacketItem009 *it,I32 x,I32 y,I32 z,I32 side,F32 fx,F32 fy,F32 fz);U8 *TileItem_getDescriptionId(TileItem *s,MCPacketItem009 *item);Bool TileItem_isEmissive(TileItem *s,I32 unused);
