// Batch 005. Source: minecraftpe/headers/tile/HayBlockTile.hpp
#ifndef MCPE_HEADERS_TILE_HAYBLOCKTILE_HPP
#define MCPE_HEADERS_TILE_HAYBLOCKTILE_HPP
class HayBlockTile: RotatedPillarTile { TextureUVCoordinateSet field_80,field_98; };
TextureUVCoordinateSet *HayBlockTile__dir(MCBlockState *self,I32 side,I32 data);
U0 HayBlockTile_Init(HayBlockTile *self,I32 id);
TextureUVCoordinateSet * HayBlockTile_getDirTexture(HayBlockTile *self,I32 side,I32 data);
U0 HayBlockTile_Destroy(HayBlockTile *self);

#endif

