// Port of minecraftpe/headers/item/ClothTileItem.hpp
class ClothTileItem { TileItem base;I32 clothID; };
U0 ClothTileItem_Init(ClothTileItem *,MCItemContext010 *,I32);TextureUVCoordinateSet *ClothTileItem_getIcon(ClothTileItem *,I32);I32 ClothTileItem_getLevelDataForAuxValue(U0 *,I32);U0 ClothTileItem_getDescriptionId(ClothTileItem *,MCPacketItem009 *,MCString *);U0 ClothTileItem_getName(ClothTileItem *,MCPacketItem009 *,MCString *);
