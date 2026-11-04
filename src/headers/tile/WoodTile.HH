// Batch 005. Source: minecraftpe/headers/tile/WoodTile.hpp
#ifndef MCPE_HEADERS_TILE_WOODTILE_HPP
#define MCPE_HEADERS_TILE_WOODTILE_HPP
class WoodTile: MCBlockState { TextureAtlasTextureItem field_80; };
U0 WoodTile_Init(WoodTile *self,I32 id);
TextureUVCoordinateSet * WoodTile_getTexture(WoodTile *self,I32 side,I32 data);
U0 WoodTile_getTypeDescriptionId(WoodTile *self,MCString *out,I32 data);
I32 WoodTile_getSpawnResourcesAuxValue(WoodTile *self,I32 data);
U0 WoodTile_Destroy(WoodTile *self);

#endif

