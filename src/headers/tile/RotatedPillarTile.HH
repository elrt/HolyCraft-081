// Batch 005. Source: minecraftpe/headers/tile/RotatedPillarTile.hpp
#ifndef MCPE_HEADERS_TILE_ROTATEDPILLARTILE_HPP
#define MCPE_HEADERS_TILE_ROTATEDPILLARTILE_HPP
class RotatedPillarTile: MCBlockState {  };
I32 RotatedPillarTile_rotatedX[6]={3,2,0,1,4,5};I32 RotatedPillarTile_rotatedZ[6]={5,4,2,3,0,1};
U0 RotatedPillarTile_Init(RotatedPillarTile *self,I32 id,Material *mat);
I32 RotatedPillarTile_getRenderShape(RotatedPillarTile *self);
TextureUVCoordinateSet * RotatedPillarTile_getDirTexture(RotatedPillarTile *self,I32 side,I32 data);
TextureUVCoordinateSet * RotatedPillarTile__dir(RotatedPillarTile *self,I32 side,I32 data);
TextureUVCoordinateSet * RotatedPillarTile_getTexture(RotatedPillarTile *self,I32 side,I32 data);
I32 RotatedPillarTile_getPlacementDataValue(RotatedPillarTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 side,F32 a,F32 b,F32 c,U0 *mob,I32 aux);
U0 RotatedPillarTile_Destroy(RotatedPillarTile *self);

#endif

