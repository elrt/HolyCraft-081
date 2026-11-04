// Port batch 001. Upstream: minecraftpe/headers/math/Pos.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_MATH_POS_HPP
#define MCPE_HEADERS_MATH_POS_HPP
class Pos { I32 x,y,z; };
U0 Pos_Init(Pos *self,I32 x,I32 y,I32 z) { self->x=x; self->y=y; self->z=z; }
U0 Pos_DefaultInit(Pos *self) {}
U0 Pos_CopyInit(Pos *self,Pos *p) { self->x=p->x; self->y=p->y; self->z=p->z; }
Bool Pos_Equal(Pos *self,Pos *p) { return self->x==p->x && self->y==p->y && self->z==p->z; }
#endif

