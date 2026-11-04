// Batch 005. Source: minecraftpe/headers/tile/HeavyTile.hpp
#ifndef MCPE_HEADERS_TILE_HEAVYTILE_HPP
#define MCPE_HEADERS_TILE_HEAVYTILE_HPP
class HeavyTile: MCBlockState {  };
Bool HeavyTile_instaFall=FALSE;
Bool HeavyTile_isFree(MCBlockWorld *w,I32 x,I32 y,I32 z);
U0 HeavyTile_Init(HeavyTile *self,I32 id,MCString *name,Material *mat);
U0 HeavyTile_InitSand(HeavyTile *self,I32 id,MCString *name);
I32 HeavyTile_getTickDelay(HeavyTile *self);
U0 HeavyTile_falling(HeavyTile *self,U0 *entity);
U0 HeavyTile_onLand(HeavyTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 data);
U0 HeavyTile_checkSlide(HeavyTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z);
U0 HeavyTile_tick(HeavyTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,Random *r);
U0 HeavyTile_onPlace(HeavyTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z);
U0 HeavyTile_neighborChanged(HeavyTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 a,I32 b,I32 c,I32 d);
U0 HeavyTile_Destroy(HeavyTile *self);

#endif

