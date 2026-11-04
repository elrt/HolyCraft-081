// Batch 005. Source: minecraftpe/headers/tile/MelonTile.hpp
#ifndef MCPE_HEADERS_TILE_MELONTILE_HPP
#define MCPE_HEADERS_TILE_MELONTILE_HPP
class MelonTile: MCBlockState { TextureUVCoordinateSet field_7C,field_94; };
U0 MelonTile_Init(MelonTile *self,I32 id);
TextureUVCoordinateSet * MelonTile_getTexture(MelonTile *self,I32 side);
TextureUVCoordinateSet * MelonTile_getTextureWorld(MelonTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 side);
I32 MelonTile_getResource(MelonTile *self,I32 data,Random *r);
I32 MelonTile_getResourceCount(MelonTile *self,Random *r);
U0 MelonTile_Destroy(MelonTile *self);

#endif

