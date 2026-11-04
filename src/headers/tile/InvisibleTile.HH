// Batch 005. Source: minecraftpe/headers/tile/InvisibleTile.hpp
#ifndef MCPE_HEADERS_TILE_INVISIBLETILE_HPP
#define MCPE_HEADERS_TILE_INVISIBLETILE_HPP
class InvisibleTile: MCBlockState {  };
U0 InvisibleTile_Init(InvisibleTile *self,I32 id,MCString *name,Material *mat);
I32 InvisibleTile_getRenderShape(InvisibleTile *self);
U0 InvisibleTile_Destroy(InvisibleTile *self);

#endif

