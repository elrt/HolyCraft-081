// Port batch 001. Upstream: minecraftpe/headers/util/TilePos.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_UTIL_TILEPOS_HPP
#define MCPE_HEADERS_UTIL_TILEPOS_HPP
class TilePos { I32 x,y,z; };
U0 TilePos_Init(TilePos *self,I32 x,I32 y,I32 z) { self->x=x; self->y=y; self->z=z; }
U0 TilePos_DefaultInit(TilePos *self) {} // Source does not initialise coordinates.
U0 TilePos_CopyInit(TilePos *self,TilePos *p) { self->x=p->x; self->y=p->y; self->z=p->z; }
U0 TilePos_MoveInit(TilePos *self,TilePos *p) { TilePos_CopyInit(self,p); }
TilePos *TilePos_Assign(TilePos *self,TilePos *p) { TilePos_CopyInit(self,p); return self; }
U32 TilePos_OrderKey(TilePos *p) { return 981131*p->y+8976890*p->x+p->z; }
Bool TilePos_Less(TilePos *self,TilePos *p) { return TilePos_OrderKey(self)<TilePos_OrderKey(p); }
Bool TilePos_Equal(TilePos *self,TilePos *p) { return self->x==p->x && self->y==p->y && self->z==p->z; }
U64 TilePos_Hash(TilePos *p) { I32 h=0xEF88B*p->y+0x88F9FA*p->x+p->z; return h; }

#endif

