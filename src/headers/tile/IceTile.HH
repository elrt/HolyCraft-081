// Batch 005. Source: minecraftpe/headers/tile/IceTile.hpp
#ifndef MCPE_HEADERS_TILE_ICETILE_HPP
#define MCPE_HEADERS_TILE_ICETILE_HPP
class IceTile: MCBlockState {  };
U0 IceTile_Init(IceTile *self,I32 id,MCString *name,Material *mat);
U0 IceTile_tick(IceTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,Random *r);
I32 IceTile_getResourceCount(IceTile *self,Random *r);
U0 IceTile_playerDestroy(IceTile *self,MCBlockWorld *w,MCBlockActor *p,I32 x,I32 y,I32 z,I32 data);
U0 IceTile_Destroy(IceTile *self);

#endif

