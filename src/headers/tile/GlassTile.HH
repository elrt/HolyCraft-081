// Batch 005. Source: minecraftpe/headers/tile/GlassTile.hpp
#ifndef MCPE_HEADERS_TILE_GLASSTILE_HPP
#define MCPE_HEADERS_TILE_GLASSTILE_HPP
class GlassTile: HalfTransparentTile {  };
U0 GlassTile_Init(GlassTile *self,I32 id,MCString *name,Material *mat);
I32 GlassTile_getRenderLayer(GlassTile *self);
I32 GlassTile_getResourceCount(GlassTile *self,Random *r);
U0 GlassTile_Destroy(GlassTile *self);

#endif

