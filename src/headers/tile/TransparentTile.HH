// Batch 005. Source: minecraftpe/headers/tile/TransparentTile.hpp
#ifndef MCPE_HEADERS_TILE_TRANSPARENTTILE_HPP
#define MCPE_HEADERS_TILE_TRANSPARENTTILE_HPP
class TransparentTile: MCBlockState { Bool field_7C;I8 field_7D,field_7E,field_7F; };
U0 TransparentTile_Init(TransparentTile *self,I32 id,MCString *name,Material *mat);
Bool TransparentTile_shouldRenderFace(TransparentTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 side);
Bool TransparentTile_isSolidRender(TransparentTile *self);
U0 TransparentTile_Destroy(TransparentTile *self);

#endif

