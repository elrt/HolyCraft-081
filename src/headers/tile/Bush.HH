// Batch 005. Source: minecraftpe/headers/tile/Bush.hpp
#ifndef MCPE_HEADERS_TILE_BUSH_HPP
#define MCPE_HEADERS_TILE_BUSH_HPP
class Bush: MCBlockState {  };
U0 Bush_Init(Bush *self,I32 id,MCString *name,Material *mat);
U0 Bush_InitPlant(Bush *self,I32 id,MCString *name);
Bool Bush_isCubeShaped(Bush *self);
I32 Bush_getRenderShape(Bush *self);
AABB * Bush_getAABB(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z);
Bool Bush_isSolidRender(Bush *self);
I32 Bush_getRenderLayer(Bush *self);
Bool Bush_mayPlaceOn(Bush *self,I32 id);
Bool Bush__soil(Bush *self,I32 id);
Bool Bush_mayPlace(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z,U8 side);
Bool Bush_canSurvive(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z);
Bool Bush_checkAlive(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z);
U0 Bush_tick(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z,Random *r);
U0 Bush_neighborChanged(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 a,I32 b,I32 c,I32 d);
U0 Bush_Destroy(Bush *self);

#endif

