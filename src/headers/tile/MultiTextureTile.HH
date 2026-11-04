// Batch 005. Source: minecraftpe/headers/tile/MultiTextureTile.hpp
#ifndef MCPE_HEADERS_TILE_MULTITEXTURETILE_HPP
#define MCPE_HEADERS_TILE_MULTITEXTURETILE_HPP
class MultiTextureTile: MCBlockState { TextureAtlasTextureItem field_7C;I32 field_A8; };
U0 MultiTextureTile_Init(MultiTextureTile *self,I32 id,MCString *name,Material *mat);
TextureUVCoordinateSet * MultiTextureTile_getTexture(MultiTextureTile *self,I32 side,I32 data);
I32 MultiTextureTile_getSpawnResourcesAuxValue(MultiTextureTile *self,I32 data);
U0 MultiTextureTile_Destroy(MultiTextureTile *self);

#endif

