// Batch 005. Source: minecraftpe/headers/tile/StoneTile.hpp
#ifndef MCPE_HEADERS_TILE_STONETILE_HPP
#define MCPE_HEADERS_TILE_STONETILE_HPP
class StoneTile: MCBlockState {  };
U0 StoneTile_Init(StoneTile *self,I32 id,MCString *name);
I32 StoneTile_getResource(StoneTile *self,I32 data,Random *r);
U0 StoneTile_Destroy(StoneTile *self);

#endif

