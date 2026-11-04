// Batch 005. Source: minecraftpe/headers/tile/MetalTile.hpp
#ifndef MCPE_HEADERS_TILE_METALTILE_HPP
#define MCPE_HEADERS_TILE_METALTILE_HPP
class MetalTile: MCBlockState {  };
U0 MetalTile_Init(MetalTile *self,I32 id,MCString *name);
TextureUVCoordinateSet * MetalTile_getTexture(MetalTile *self,I32 side);
U0 MetalTile_Destroy(MetalTile *self);

#endif

