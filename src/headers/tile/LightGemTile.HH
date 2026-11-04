// Batch 005. Source: minecraftpe/headers/tile/LightGemTile.hpp
#ifndef MCPE_HEADERS_TILE_LIGHTGEMTILE_HPP
#define MCPE_HEADERS_TILE_LIGHTGEMTILE_HPP
class LightGemTile: MCBlockState {  };
U0 LightGemTile_Init(LightGemTile *self,I32 id,MCString *name,Material *mat);
I32 LightGemTile_getResource(LightGemTile *self,I32 data,Random *r);
I32 LightGemTile_getResourceCount(LightGemTile *self,Random *r);
U0 LightGemTile_Destroy(LightGemTile *self);

#endif

