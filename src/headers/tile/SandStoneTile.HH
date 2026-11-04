// Batch 005. Source: minecraftpe/headers/tile/SandStoneTile.hpp
#ifndef MCPE_HEADERS_TILE_SANDSTONETILE_HPP
#define MCPE_HEADERS_TILE_SANDSTONETILE_HPP
class SandStoneTile: MultiTextureTile { TextureUVCoordinateSet field_B0,field_C8; };
U0 SandStoneTile_Init(SandStoneTile *self,I32 id,MCString *name);
TextureUVCoordinateSet * SandStoneTile_getTexture(SandStoneTile *self,I32 side,I32 data);
U0 SandStoneTile_Destroy(SandStoneTile *self);

#endif

