// Batch 005. Source: minecraftpe/headers/tile/OreTile.hpp
#ifndef MCPE_HEADERS_TILE_ORETILE_HPP
#define MCPE_HEADERS_TILE_ORETILE_HPP
class OreTile: MCBlockState {  };
U0 OreTile_Init(OreTile *self,I32 id,MCString *name);
I32 OreTile_getResource(OreTile *self,I32 data,Random *r);
I32 OreTile_getResourceCount(OreTile *self,Random *r);
I32 OreTile_getSpawnResourcesAuxValue(OreTile *self,I32 data);
U0 OreTile_Destroy(OreTile *self);

#endif

