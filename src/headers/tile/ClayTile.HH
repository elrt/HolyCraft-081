// Batch 005. Source: minecraftpe/headers/tile/ClayTile.hpp
#ifndef MCPE_HEADERS_TILE_CLAYTILE_HPP
#define MCPE_HEADERS_TILE_CLAYTILE_HPP
class ClayTile: MCBlockState {  };
U0 ClayTile_Init(ClayTile *self,I32 id,MCString *name,Material *mat);
I32 ClayTile_getResource(ClayTile *self,I32 data,Random *r);
I32 ClayTile_getResourceCount(ClayTile *self,Random *r);
U0 ClayTile_Destroy(ClayTile *self);

#endif

