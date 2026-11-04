// Batch 005. Source: minecraftpe/headers/tile/SnowTile.hpp
#ifndef MCPE_HEADERS_TILE_SNOWTILE_HPP
#define MCPE_HEADERS_TILE_SNOWTILE_HPP
class SnowTile: MCBlockState {  };
U0 SnowTile_Init(SnowTile *self,I32 id,MCString *name,Material *mat);
U0 SnowTile_tick(SnowTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,Random *r);
I32 SnowTile_getResource(SnowTile *self,I32 data,Random *r);
I32 SnowTile_getResourceCount(SnowTile *self,Random *r);
U0 SnowTile_Destroy(SnowTile *self);

#endif

