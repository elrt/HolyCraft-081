// Batch 005. Source: minecraftpe/headers/tile/WebTile.hpp
#ifndef MCPE_HEADERS_TILE_WEBTILE_HPP
#define MCPE_HEADERS_TILE_WEBTILE_HPP
class WebTile: MCBlockState {  };
U0 WebTile_Init(WebTile *self,I32 id,MCString *name,Material *mat);
Bool WebTile_isCubeShaped(WebTile *self);
I32 WebTile_getRenderShape(WebTile *self);
AABB * WebTile_getAABB(WebTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z);
Bool WebTile_isSolidRender(WebTile *self);
I32 WebTile_getResource(WebTile *self,I32 data,Random *r);
I32 WebTile_getRenderLayer(WebTile *self);
U0 WebTile_entityInside(WebTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,MCBlockActor *actor);
U0 WebTile_Destroy(WebTile *self);

#endif

