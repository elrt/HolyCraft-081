// Batch 005. Source: minecraftpe/headers/tile/GravelTile.hpp
#ifndef MCPE_HEADERS_TILE_GRAVELTILE_HPP
#define MCPE_HEADERS_TILE_GRAVELTILE_HPP
class GravelTile: HeavyTile {  };
U0 GravelTile_Init(GravelTile *self,I32 id,MCString *name);
I32 GravelTile_getResource(GravelTile *self,I32 data,Random *r);
U0 GravelTile_Destroy(GravelTile *self);

#endif

