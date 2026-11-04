// Batch 005. Source: minecraftpe/headers/tile/WorkbenchTile.hpp
#ifndef MCPE_HEADERS_TILE_WORKBENCHTILE_HPP
#define MCPE_HEADERS_TILE_WORKBENCHTILE_HPP
class WorkbenchTile: MCBlockState { TextureUVCoordinateSet field_80,field_98,field_B0,field_C8; };
U0 WorkbenchTile_Init(WorkbenchTile *self,I32 id);
TextureUVCoordinateSet * WorkbenchTile_getTexture(WorkbenchTile *self,I32 side);
Bool WorkbenchTile_use(WorkbenchTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,MCBlockActor *p);
U0 WorkbenchTile_Destroy(WorkbenchTile *self);

#endif

