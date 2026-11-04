// Batch 005. Source: minecraftpe/headers/tile/StonecutterTile.hpp
#ifndef MCPE_HEADERS_TILE_STONECUTTERTILE_HPP
#define MCPE_HEADERS_TILE_STONECUTTERTILE_HPP
class StonecutterTile: MCBlockState { TextureUVCoordinateSet field_80,field_98,field_B0,field_C8; };
U0 StonecutterTile_Init(StonecutterTile *self,I32 id);
TextureUVCoordinateSet * StonecutterTile_getTexture(StonecutterTile *self,I32 side);
Bool StonecutterTile_use(StonecutterTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,MCBlockActor *p);
U0 StonecutterTile_Destroy(StonecutterTile *self);

#endif

