// Batch 005. Source: minecraftpe/headers/tile/ClothTile.hpp
#ifndef MCPE_HEADERS_TILE_CLOTHTILE_HPP
#define MCPE_HEADERS_TILE_CLOTHTILE_HPP
class ClothTile: MCBlockState { TextureAtlasTextureItem tex; };
U0 ClothTile_Init(ClothTile *self,I32 id);
TextureUVCoordinateSet * ClothTile_getTexture(ClothTile *self,I32 side,I32 data);
I32 ClothTile_getSpawnResourcesAuxValue(ClothTile *self,I32 data);
U0 ClothTile_Destroy(ClothTile *self);

#endif

