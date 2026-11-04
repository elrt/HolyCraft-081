// Batch 005. Source: minecraftpe/headers/tile/HalfTransparentTile.hpp
#ifndef MCPE_HEADERS_TILE_HALFTRANSPARENTTILE_HPP
#define MCPE_HEADERS_TILE_HALFTRANSPARENTTILE_HPP
class HalfTransparentTile: MCBlockState { Bool field_80; };
U0 HalfTransparentTile_Init(HalfTransparentTile *self,I32 id,MCString *name,Material *mat);
Bool HalfTransparentTile_shouldRenderFace(HalfTransparentTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 side);
Bool HalfTransparentTile_isSolidRender(HalfTransparentTile *self);
I32 HalfTransparentTile_getRenderLayer(HalfTransparentTile *self);
U0 HalfTransparentTile_Destroy(HalfTransparentTile *self);

#endif

