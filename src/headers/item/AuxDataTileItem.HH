// Batch 009: minecraftpe/headers/item/AuxDataTileItem.hpp
class AuxDataTileItem { TileItem base;I32 tileID; };
U0 AuxDataTileItem_Init(AuxDataTileItem *s,MCItemContext009 *c,MCPlaceContext009 *p,I32 id,I32 tile);TextureUVCoordinateSet *AuxDataTileItem_getIcon(AuxDataTileItem *s,I32 aux,I32 unused,Bool use);I32 AuxDataTileItem_getLevelDataForAuxValue(U0 *s,I32 aux);U0 AuxDataTileItem_getName(AuxDataTileItem *s,MCPacketItem009 *it,MCString *out);U0 AuxDataTileItem_getDescription(AuxDataTileItem *s,MCPacketItem009 *it,MCString *out);
